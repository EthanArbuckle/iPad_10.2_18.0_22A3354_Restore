@implementation UITraitCollection

- (UIImageConfiguration)imageConfiguration
{
  return (UIImageConfiguration *)-[UIImageConfiguration _initWithTraitCollection:]([UIImageConfiguration alloc], "_initWithTraitCollection:", self);
}

- (char)_traitCollectionRelevantForImageConfiguration
{
  char *v2;
  char *v3;

  if (!object)
    return 0;
  if ((object[288] & 8) == 0)
  {
    +[UITraitCollection _systemTraitTokensAffectingImageLookupSet]();
    v2 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:](object, qword_1ECD7E7D0);
    v3 = v2;
    if (v2)
    {
      if (v2 != object)
      {
        objc_setAssociatedObject(object, &_MergedGlobals_1093, v2, (void *)1);
        object[288] |= 8u;
      }
      objc_setAssociatedObject(v3, &_MergedGlobals_1093, v3, 0);
      v3[288] |= 8u;
    }
    return v3;
  }
  return (char *)objc_getAssociatedObject(object, &_MergedGlobals_1093);
}

- (UIDisplayGamut)displayGamut
{
  _UIRecordTraitUsage((unint64_t)self, 8uLL);
  return self->_builtinTraits.displayGamut;
}

+ (char)_currentTraitCollectionWithFallback:(int)a3 markFallback:
{
  char **TraitCollectionTSD;
  char *v6;
  char **v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double *v18;
  char v19;
  void **v20;
  unint64_t v21;
  void *v22;
  __int128 v23;
  void **v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  objc_opt_self();
  TraitCollectionTSD = (char **)GetTraitCollectionTSD();
  v6 = *TraitCollectionTSD;
  if (*TraitCollectionTSD)
  {
    v7 = TraitCollectionTSD;
    if (*((_BYTE *)TraitCollectionTSD + 8))
    {
LABEL_72:
      v29 = v6;
      return v6;
    }
    v8 = *(_OWORD *)(v6 + 168);
    v9 = *(_OWORD *)(v6 + 184);
    v10 = *(_OWORD *)(v6 + 200);
    v44 = *((_QWORD *)v6 + 27);
    v11 = *(_OWORD *)(v6 + 24);
    v31 = *(_OWORD *)(v6 + 8);
    v32 = v11;
    v12 = *(_OWORD *)(v6 + 40);
    v13 = *(_OWORD *)(v6 + 56);
    v14 = *(_OWORD *)(v6 + 88);
    v35 = *(_OWORD *)(v6 + 72);
    v36 = v14;
    v33 = v12;
    v34 = v13;
    v15 = *(_OWORD *)(v6 + 104);
    v16 = *(_OWORD *)(v6 + 120);
    v17 = *(_OWORD *)(v6 + 152);
    v39 = *(_OWORD *)(v6 + 136);
    v40 = v17;
    v37 = v15;
    v38 = v16;
    v42 = v9;
    v43 = v10;
    v41 = v8;
    if ((_QWORD)v31 == -1)
    {
      v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
      if (v18 && *((_QWORD *)v18 + 1) != -1)
      {
        *(double *)&v31 = v18[1];
        v19 = 1;
LABEL_6:
        if (*((double *)&v31 + 1) == 0.0)
        {
          if (!v18)
          {
            v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
            if (!v18)
            {
              if ((_QWORD)v32 != -1)
              {
                v18 = 0;
                goto LABEL_29;
              }
              goto LABEL_13;
            }
          }
          if (v18[2] != 0.0)
          {
            *((double *)&v31 + 1) = v18[2];
            v19 = 1;
          }
        }
        if ((_QWORD)v32 != -1)
          goto LABEL_29;
        if (v18)
        {
LABEL_14:
          if (*((_QWORD *)v18 + 3) != -1)
          {
            *(double *)&v32 = v18[3];
            v19 = 1;
          }
LABEL_29:
          v25 = *((_QWORD *)&v35 + 1);
          if (!*((_QWORD *)&v35 + 1))
          {
            if (!v18)
            {
              v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
              if (!v18)
              {
                v25 = 0;
                if ((_QWORD)v36 != -1)
                  goto LABEL_39;
                goto LABEL_36;
              }
            }
            v25 = *((_QWORD *)v18 + 10);
            if (v25)
            {
              *((double *)&v35 + 1) = v18[10];
              v19 = 1;
            }
          }
          if ((_QWORD)v36 != -1)
            goto LABEL_39;
          if (v18)
          {
LABEL_37:
            if (*((_QWORD *)v18 + 11) != -1)
            {
              *(double *)&v36 = v18[11];
              v19 = 1;
            }
LABEL_39:
            if (!(_QWORD)v37)
            {
              if (!v18)
              {
                v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
                if (!v18)
                {
                  if ((_QWORD)v38 != -1)
                  {
                    v18 = 0;
                    goto LABEL_49;
                  }
                  goto LABEL_46;
                }
              }
              if (*((_QWORD *)v18 + 13))
              {
                *(double *)&v37 = v18[13];
                v19 = 1;
              }
            }
            if ((_QWORD)v38 != -1)
              goto LABEL_49;
            if (v18)
            {
LABEL_47:
              if (*((_QWORD *)v18 + 15) != -1)
              {
                *(double *)&v38 = v18[15];
                v19 = 1;
              }
LABEL_49:
              if ((_QWORD)v40 == -1)
              {
                if (!v18)
                {
                  v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
                  if (!v18)
                  {
                    if (*((_QWORD *)&v40 + 1) != -1)
                    {
                      v18 = 0;
                      goto LABEL_59;
                    }
                    goto LABEL_56;
                  }
                }
                if (*((_QWORD *)v18 + 19) != -1)
                {
                  *(double *)&v40 = v18[19];
                  v19 = 1;
                }
              }
              if (*((_QWORD *)&v40 + 1) != -1)
                goto LABEL_59;
              if (v18)
              {
LABEL_57:
                if (*((_QWORD *)v18 + 20) != -1)
                {
                  *((double *)&v40 + 1) = v18[20];
                  v19 = 1;
                }
LABEL_59:
                if ((_QWORD)v41 == -1
                  && (v18 || (v18 = (double *)+[UITraitCollection _fallbackTraitCollection]()) != 0)
                  && *((_QWORD *)v18 + 21) != -1)
                {
                  *(double *)&v41 = v18[21];
                  v19 = 1;
                }
                if (v25 == 1 || (dyld_program_sdk_at_least() & 1) != 0)
                {
                  if ((v19 & 1) == 0)
                  {
LABEL_71:
                    *((_BYTE *)v7 + 8) = 1;
                    goto LABEL_72;
                  }
                }
                else
                {
                  *((_QWORD *)&v35 + 1) = 1;
                }
                v26 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v31, *((void **)v6 + 30), *((void **)v6 + 28), *((void **)v6 + 29));
                _UITraitCollectionWasCopied((unint64_t)v6, (unint64_t)v26);
                v27 = v26;
                if (v6 != v27)
                {
                  v28 = v27;

                  *v7 = v28;
                  v6 = v28;
                }
                goto LABEL_71;
              }
LABEL_56:
              v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
              if (!v18)
                goto LABEL_59;
              goto LABEL_57;
            }
LABEL_46:
            v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
            if (!v18)
              goto LABEL_49;
            goto LABEL_47;
          }
LABEL_36:
          v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
          if (!v18)
            goto LABEL_39;
          goto LABEL_37;
        }
LABEL_13:
        v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
        if (!v18)
          goto LABEL_29;
        goto LABEL_14;
      }
    }
    else
    {
      v18 = 0;
    }
    v19 = 0;
    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_22;
  v20 = (void **)+[UITraitCollection _fallbackTraitCollection]();
  v21 = (unint64_t)v20;
  if (!a3)
  {
    v24 = v20;
    v6 = (char *)v21;
    return v6;
  }
  if (v20)
  {
    v6 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)(v20 + 1), v20[30], v20[28], v20[29]);
    _UITraitCollectionWasCopied(v21, (unint64_t)v6);
    v22 = (void *)*((_QWORD *)v6 + 31);
    if (v22)

    *((_QWORD *)v6 + 31) = objc_msgSend(*(id *)(v21 + 248), "mutableCopy");
    v23 = *(_OWORD *)(v21 + 272);
    *((_OWORD *)v6 + 16) = *(_OWORD *)(v21 + 256);
    *((_OWORD *)v6 + 17) = v23;
    v6[288] |= 5u;
  }
  else
  {
LABEL_22:
    v6 = 0;
  }
  return v6;
}

+ (void)setCurrentTraitCollection:(UITraitCollection *)currentTraitCollection
{
  id *TraitCollectionTSD;
  id *v5;
  UITraitCollection *v6;

  TraitCollectionTSD = (id *)GetTraitCollectionTSD();
  if (*TraitCollectionTSD != currentTraitCollection)
  {
    v5 = TraitCollectionTSD;

    if (!currentTraitCollection || (*(_BYTE *)&currentTraitCollection->_flags & 4) != 0)
      v6 = 0;
    else
      v6 = currentTraitCollection;
    *v5 = v6;
    *((_BYTE *)v5 + 8) = 0;
  }
}

- (CGFloat)displayScale
{
  _UIRecordTraitUsage((unint64_t)self, 3uLL);
  return self->_builtinTraits.displayScale;
}

+ (char)_currentTraitCollectionIfExists
{
  objc_opt_self();
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 0, 0);
}

+ (id)_fallbackTraitCollection
{
  objc_opt_self();
  if (pthread_main_np() == 1)
    return (id)_UIGetCurrentFallbackTraitCollection();
  else
    return +[UITraitCollection _backgroundThreadFallbackTraitCollection]();
}

+ (id)_backgroundThreadFallbackTraitCollection
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
  v0 = (id)_backgroundThreadFallbackTraitCollection;
  os_unfair_lock_unlock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
  if (v0)
    return v0;
  else
    return (id)+[UITraitCollection _defaultTraitCollection]();
}

void __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD))
{
  void (*v5)(_QWORD, _QWORD, _QWORD);
  uint64_t *v6;
  void (*v7[7])(_QWORD, _QWORD, _QWORD);

  v5 = (void (*)(_QWORD, _QWORD, _QWORD))-[UITraitCollection _specifiedTraitTokens](*(_QWORD *)(a1 + 32));
  v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](*(_QWORD *)(a1 + 40));
  v7[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v7[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD, _QWORD))__96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke_2;
  v7[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC4F0;
  v7[5] = a3;
  v7[6] = v5;
  v7[4] = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40);
  _UITraitTokenSetEnumerate(v6, v7);
}

- (int64_t)_valueForNSIntegerTraitToken:(id)a3
{
  _OWORD v5[3];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 3uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v6 = v10;
  return (int64_t)-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

void __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];
  void (*v9[4])(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v2 = -[UITraitCollection _specifiedTraitTokensLocked](a1[4]);
  v3 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a1[5]);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v9[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v9[2] = (void (*)(_QWORD, _QWORD, _QWORD))__109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2;
  v9[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC360;
  v10 = *((_OWORD *)a1 + 2);
  v11 = a1[6];
  v12 = v2;
  _UITraitTokenSetEnumerate(v3, v9);
  v5 = a1[6];
  if (*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
  {
    v6 = *(void **)(a1[4] + 224);
    if (v6)
    {
      v7 = a1[5];
      if (*(_QWORD *)(v7 + 224))
      {
        v8[0] = v4;
        v8[1] = 3221225472;
        v8[2] = __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3;
        v8[3] = &unk_1E16CC388;
        v8[4] = v7;
        v8[5] = v5;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
      }
    }
  }
}

- (const)_valueForTraitWithMetadata:(unint64_t)a1
{
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFNumberType v12;
  void *v13;
  _OWORD valuePtr[3];
  uint64_t v16;

  if (!a1)
    return 0;
  _UIRecordTraitUsage(a1, *(_QWORD *)a2);
  if (*(_QWORD *)a2 > 0x1AuLL)
  {
    v7 = *(_QWORD *)(a2 + 8);
    v6 = *(_QWORD *)(a2 + 16);
    v8 = *(_QWORD *)(a2 + 24);
    v5 = *(_QWORD **)(a2 + 40);
    v9 = *(_BYTE *)(a2 + 48);
    v10 = (const __CFNumber *)objc_msgSend(*(id *)(a1 + 224), "objectForKey:", v8);
    if (v10)
    {
      v11 = v10;
      switch(v7)
      {
        case 1:
          if (v10 == (const __CFNumber *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            return 0;
          else
            return (const __CFString *)v11;
        case 2:
          *(_QWORD *)&valuePtr[0] = 0;
          v12 = kCFNumberCGFloatType;
          goto LABEL_14;
        case 3:
        case 4:
          *(_QWORD *)&valuePtr[0] = 0;
          v12 = kCFNumberNSIntegerType;
LABEL_14:
          CFNumberGetValue(v10, v12, valuePtr);
          v5 = *(_QWORD **)&valuePtr[0];
          break;
        default:
          return 0;
      }
    }
    else if ((v9 & 1) != 0)
    {
      switch(v7)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          v5 = (_QWORD *)*v5;
          break;
        default:
          v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v6);
          return 0;
      }
    }
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 16);
    valuePtr[0] = *(_OWORD *)a2;
    valuePtr[1] = v4;
    valuePtr[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_QWORD *)(a2 + 48);
    return -[UITraitCollection _valueForBuiltInTraitWithMetadata:]((_QWORD *)a1, valuePtr);
  }
  return (const __CFString *)v5;
}

- (const)_valueForBuiltInTraitWithMetadata:(_QWORD *)a1
{
  const __CFString *result;

  switch(*a2)
  {
    case 0:
      result = (const __CFString *)a1[1];
      break;
    case 1:
      result = (const __CFString *)a1[10];
      break;
    case 2:
      result = (const __CFString *)a1[11];
      break;
    case 3:
      result = (const __CFString *)a1[2];
      break;
    case 4:
      result = (const __CFString *)a1[8];
      break;
    case 5:
      result = (const __CFString *)a1[9];
      break;
    case 6:
      result = (const __CFString *)a1[12];
      break;
    case 7:
      result = _NSStringFromUIContentSizeCategory(a1[13]);
      break;
    case 8:
      result = (const __CFString *)a1[3];
      break;
    case 9:
      result = (const __CFString *)a1[19];
      break;
    case 0xALL:
      result = (const __CFString *)a1[20];
      break;
    case 0xBLL:
      result = (const __CFString *)a1[15];
      break;
    case 0xCLL:
      result = (const __CFString *)a1[23];
      break;
    case 0xDLL:
      result = (const __CFString *)a1[27];
      break;
    case 0xELL:
      result = (const __CFString *)a1[4];
      break;
    case 0xFLL:
      result = (const __CFString *)a1[5];
      break;
    case 0x10:
      result = (const __CFString *)a1[6];
      break;
    case 0x11:
      result = (const __CFString *)a1[7];
      break;
    case 0x12:
      result = (const __CFString *)a1[14];
      break;
    case 0x13:
      result = (const __CFString *)a1[16];
      break;
    case 0x14:
      result = (const __CFString *)a1[17];
      break;
    case 0x15:
      result = (const __CFString *)a1[18];
      break;
    case 0x16:
      result = (const __CFString *)a1[21];
      break;
    case 0x17:
      result = (const __CFString *)a1[22];
      break;
    case 0x18:
      result = (const __CFString *)a1[24];
      break;
    case 0x19:
      result = (const __CFString *)a1[25];
      break;
    case 0x1ALL:
      result = (const __CFString *)a1[26];
      break;
    default:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__valueForBuiltInTraitWithMetadata_, a1, CFSTR("UITraitCollection_NonARC.m"), 789, CFSTR("Invalid built in trait value: %lu"), *a2);
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)_matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1
{
  uint64_t v3;
  uint64_t *v5;
  void *v6;
  void *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!a1)
    return 0;
  v3 = 1;
  if (a2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke;
    v9[3] = &unk_1E16CC3B0;
    v9[4] = a1;
    v9[5] = a2;
    v9[6] = &v10;
    _UIPerformWithTraitLock((uint64_t)v9);
    v5 = v11;
    if (*((_BYTE *)v11 + 24))
    {
      v6 = *(void **)(a1 + 232);
      if (v6)
      {
        v7 = *(void **)(a2 + 232);
        if (v7)
        {
          if (v6 != v7)
          {
            v3 = objc_msgSend(v6, "isEqual:");
            v5 = v11;
          }
          *((_BYTE *)v5 + 24) = v3;
        }
      }
    }
    else
    {
      v3 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

- (UIUserInterfaceSizeClass)horizontalSizeClass
{
  _UIRecordTraitUsage((unint64_t)self, 4uLL);
  return self->_builtinTraits.horizontalSizeClass;
}

- (unint64_t)artworkSubtype
{
  _UIRecordTraitUsage((unint64_t)self, 0x11uLL);
  return self->_builtinTraits.artworkSubtype;
}

- (void)_enumerateThemeAppearanceNamesForLookup:(void *)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  _BYTE v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v16 = objc_msgSend(result, "userInterfaceStyle");
    v20[0] = v16;
    v20[1] = 0;
    v4 = objc_msgSend(v3, "accessibilityContrast");
    v5 = 0;
    v19[0] = v4 == 1;
    v19[1] = 0;
    v17 = 1;
LABEL_3:
    v6 = 0;
    v7 = v20[v5];
    v8 = 1;
    while (1)
    {
      v9 = v19[v6] == 0;
      if (v19[v6])
        v10 = CFSTR("UIAppearanceHighContrastLight");
      else
        v10 = CFSTR("UIAppearanceLight");
      if (v19[v6])
        v11 = CFSTR("UIAppearanceHighContrastDark");
      else
        v11 = CFSTR("UIAppearanceDark");
      if (v9)
        v12 = CFSTR("UIAppearanceAny");
      else
        v12 = CFSTR("UIAppearanceHighContrastAny");
      if (v7 != 2)
        v11 = v12;
      v13 = v7 == 1 ? v10 : v11;
      v18 = 0;
      result = (void *)(*(uint64_t (**)(uint64_t, const __CFString *, char *))(a2 + 16))(a2, v13, &v18);
      if (v18)
        break;
      v14 = (v4 != 1) | ~v8;
      v6 = 1;
      v8 = 0;
      if ((v14 & 1) != 0)
      {
        v15 = (v16 != 0) & v17;
        v5 = 1;
        v17 = 0;
        if ((v15 & 1) != 0)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (void)_fallbackTraitCollection
{
  return self;
}

- (UIUserInterfaceSizeClass)verticalSizeClass
{
  _UIRecordTraitUsage((unint64_t)self, 5uLL);
  return self->_builtinTraits.verticalSizeClass;
}

- (UITraitEnvironmentLayoutDirection)layoutDirection
{
  _UIRecordTraitUsage((unint64_t)self, 2uLL);
  return self->_builtinTraits.layoutDirection;
}

- (UIUserInterfaceIdiom)userInterfaceIdiom
{
  _UIRecordTraitUsage((unint64_t)self, 0);
  return self->_builtinTraits.userInterfaceIdiom;
}

- (UIUserInterfaceActiveAppearance)activeAppearance
{
  _UIRecordTraitUsage((unint64_t)self, 0xCuLL);
  return self->_builtinTraits.activeAppearance;
}

- (BOOL)isEqual:(id)a3
{
  NSDictionary *clientDefinedTraits;
  void *v6;
  uint64_t v7;
  _BYTE *TraitCollectionTSD;
  char v9;
  NSObject *environmentWrapper;
  NSObject *v11;
  char v12;
  int8x16_t *v13;
  _QWORD v15[9];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0 || (*((_BYTE *)a3 + 288) & 1) == 0)
  {
LABEL_5:
    if (!memcmp(&self->_builtinTraits, (char *)a3 + 8, 0xD8uLL))
      goto LABEL_6;
    return 0;
  }
  v13 = _UITraitTokenSetCount((uint64_t)&self->_specifiedTraitTokens);
  if (v13 != _UITraitTokenSetCount((uint64_t)a3 + 248))
    return 0;
  if (v13)
  {
    if (!_UITraitTokenSetIsEqualToSet((uint64_t)&self->_specifiedTraitTokens, (uint64_t)a3 + 248))
      return 0;
    goto LABEL_5;
  }
LABEL_6:
  if (self->_clientDefinedTraits)
    clientDefinedTraits = self->_clientDefinedTraits;
  else
    clientDefinedTraits = (NSDictionary *)MEMORY[0x1E0C9AA70];
  if (*((_QWORD *)a3 + 28))
    v6 = (void *)*((_QWORD *)a3 + 28);
  else
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v7 = -[NSDictionary count](clientDefinedTraits, "count");
  if (v7 != objc_msgSend(v6, "count"))
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  TraitCollectionTSD = GetTraitCollectionTSD();
  v9 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29__UITraitCollection_isEqual___block_invoke;
  v15[3] = &unk_1E16CC110;
  v15[4] = clientDefinedTraits;
  v15[5] = v6;
  v15[7] = a3;
  v15[8] = &v16;
  v15[6] = self;
  _UIPerformWithTraitLock((uint64_t)v15);
  *((_BYTE *)GetTraitCollectionTSD() + 9) = v9;
  if (*((_BYTE *)v17 + 24))
  {
    environmentWrapper = self->_environmentWrapper;
    v11 = *((_QWORD *)a3 + 29);
    if (environmentWrapper == v11)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (environmentWrapper && v11)
        v12 = -[NSObject isEqual:](environmentWrapper, "isEqual:");
    }
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v12;
}

+ (char)_currentTraitCollectionWithUnmarkedFallback
{
  objc_opt_self();
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 0);
}

- (void)_traitCollectionByApplyingOverrides:(uint64_t)a3 defaultValueOverrides:
{
  void *v3;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[10];
  BOOL v13;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[6];

  v3 = a1;
  if (a1)
  {
    if (a3)
      v6 = _UITraitTokenSetCount(a3 + 16) != 0;
    else
      v6 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3052000000;
    v19[3] = __Block_byref_object_copy__115;
    v19[4] = __Block_byref_object_dispose__115;
    v19[5] = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v7 = MEMORY[0x1E0C809B0];
    if (a2)
    {
      v9 = *(_QWORD *)(a2 + 232);
      v8 = *(_QWORD *)(a2 + 240);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke;
      v14[3] = &unk_1E16CC540;
      v14[4] = v8;
      v14[5] = v9;
      v14[6] = a2;
      v14[7] = &v15;
      v14[8] = v19;
      _UIPerformWithTraitLock((uint64_t)v14);
      if (*((_BYTE *)v16 + 24) || v6)
        goto LABEL_10;
    }
    else if (v6)
    {
      v8 = 0;
      v9 = 0;
LABEL_10:
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_2;
      v12[3] = &unk_1E16CC5B8;
      v12[4] = a2;
      v12[5] = v3;
      v13 = v6;
      v12[6] = a3;
      v12[7] = v9;
      v12[8] = v8;
      v12[9] = v19;
      v10 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v3, (uint64_t)v12);
LABEL_12:
      v3 = v10;
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(v19, 8);
      return v3;
    }
    v10 = v3;
    goto LABEL_12;
  }
  return v3;
}

uint64_t __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke(_QWORD *a1)
{
  BOOL v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1[4] || a1[5])
  {
    v2 = 1;
  }
  else
  {
    v10 = -[UITraitCollection _specifiedTraitTokensLocked](a1[6]);
    v2 = _UITraitTokenSetCount(v10) != 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v2;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(a1[6] + 224);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (!objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", v8))
        {
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
          v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
          if (v9)
            objc_msgSend(v9, "addObject:", v8);
          else
            *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __29__UITraitCollection_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__UITraitCollection_isEqual___block_invoke_2;
  v4[3] = &unk_1E16CC0E8;
  v2 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = v2;
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);
}

+ (UITraitCollection)traitCollectionWithDisplayScale:(CGFloat)scale
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _QWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  if (scale == 1.0)
  {
    if (qword_1ECD7E550 != -1)
      dispatch_once(&qword_1ECD7E550, &__block_literal_global_177);
    return (UITraitCollection *)qword_1ECD7E548;
  }
  else if (scale == 2.0)
  {
    if (qword_1ECD7E560 != -1)
      dispatch_once(&qword_1ECD7E560, &__block_literal_global_180);
    return (UITraitCollection *)qword_1ECD7E558;
  }
  else if (scale == 3.0)
  {
    if (qword_1ECD7E570 != -1)
      dispatch_once(&qword_1ECD7E570, &__block_literal_global_183);
    return (UITraitCollection *)qword_1ECD7E568;
  }
  else if (scale == 0.0)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    v17 = xmmword_1866823F8;
    v18 = unk_186682408;
    v19 = xmmword_186682418;
    v20 = -1;
    v13 = xmmword_1866823B8;
    v14 = unk_1866823C8;
    v15 = xmmword_1866823D8;
    v16 = unk_1866823E8;
    v9 = xmmword_186682378;
    v10 = unk_186682388;
    v11 = xmmword_186682398;
    v12 = unk_1866823A8;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v8 = unk_186682368;
    *(CGFloat *)&v7[1] = scale;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 3uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
}

- (id)_traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:(id)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke;
    v2[3] = &unk_1E16CC518;
    v2[4] = result;
    v2[5] = a2;
    return -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](result, (uint64_t)v2);
  }
  return result;
}

uint64_t __64__UITraitCollection__traitTokensIncludingPlaceholdersForTraits___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", _UITraitTokenForTraitLocked(0, *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++)));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_3;
  v4[3] = &unk_1E16CC450;
  v2 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = v2;
  v7 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "enumerateObjectsWithOptions:usingBlock:", 2, v4);
}

void __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  void (*v8[4])(_QWORD, _QWORD, _QWORD);
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v2 = -[UITraitCollection _specifiedTraitTokensLocked](a1[4]);
  v3 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a1[5]);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD, _QWORD))__97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC360;
  v9 = *((_OWORD *)a1 + 2);
  v10 = a1[6];
  v11 = v2;
  _UITraitTokenSetEnumerate(v3, v8);
  v5 = a1[6];
  if (*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
  {
    v6 = *(void **)(a1[5] + 224);
    if (v6)
    {
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3;
      v7[3] = &unk_1E16CC388;
      v7[4] = a1[4];
      v7[5] = v5;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
    }
  }
}

uint64_t __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke_2;
  v4[3] = &unk_1E16CC1B0;
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  v4[1] = 3221225472;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (id)_traitCollectionByReplacingNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  __int128 v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, a3, v7);
}

- (id)_traitCollectionByReplacingValue:(__int128 *)a3 forTraitWithMetadata:
{
  __int128 v3;
  _QWORD v4[6];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  if (result)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke;
    v4[3] = &unk_1E16CC640;
    v4[4] = result;
    v4[5] = a2;
    v3 = a3[1];
    v5 = *a3;
    v6 = v3;
    v7 = a3[2];
    v8 = *((_QWORD *)a3 + 6);
    return -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](result, (uint64_t)v4);
  }
  return result;
}

- (id)_traitCollectionByModifyingTraitsCopyOnWrite:(void *)a1
{
  id v2;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v2 = a1;
  if (a1)
  {
    if (!a2)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__traitCollectionByModifyingTraitsCopyOnWrite_, a1, CFSTR("UITraitCollection_NonARC.m"), 1249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mutations != NULL"));
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__115;
    v14 = __Block_byref_object_dispose__115;
    v15 = 0;
    v8[5] = &v10;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke;
    v9[3] = &unk_1E16CC0C0;
    v9[4] = v2;
    v9[5] = &v10;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke_2;
    v8[3] = &unk_1E16CC0C0;
    v8[4] = v2;
    (*(void (**)(uint64_t, _QWORD *, _QWORD *))(a2 + 16))(a2, v9, v8);
    v4 = v11;
    v5 = v11[5];
    if (v5)
    {
      *(_BYTE *)(v5 + 288) &= ~2u;
      v6 = (id)v4[5];
    }
    else
    {
      v6 = v2;
      v11[5] = (uint64_t)v6;
    }
    v2 = v6;
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

void __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int8x16_t v14;
  uint64_t v15;

  v7 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(const __CFString **)(v7 + 8);
  v8 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v13 = v8;
  v14 = *(int8x16_t *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 96);
  if (v6 != -[UITraitCollection _valueForTraitWithMetadata:](v5, (uint64_t)&v12))
  {
    v9 = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    v10 = *(_QWORD **)(a1 + 40);
    v11 = *(_OWORD *)(a1 + 64);
    v12 = *(_OWORD *)(a1 + 48);
    v13 = v11;
    v14 = *(int8x16_t *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 96);
    -[UITraitCollection _setValue:forTraitWithMetadata:](v9, v10, (uint64_t)&v12, v14);
  }
}

- (UIColor)_tintColor
{
  return self->_tintColor;
}

- (UIAccessibilityContrast)accessibilityContrast
{
  _UIRecordTraitUsage((unint64_t)self, 9uLL);
  return self->_builtinTraits.accessibilityContrast;
}

- (UITraitCollection)traitCollectionByReplacingNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)-[UITraitCollection _traitCollectionByReplacingNSIntegerValue:forTraitToken:](self, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", value, v7);
}

- (char)_traitCollectionByReplacingTintColor:(char *)result
{
  unint64_t v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;

  if (result)
  {
    v3 = (unint64_t)result;
    v4 = (void *)*((_QWORD *)result + 30);
    if (v4 == a2 || a2 && v4 && objc_msgSend(v4, "isEqual:", a2))
    {
      return (char *)(id)v3;
    }
    else
    {
      v5 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], v3 + 8, a2, *(void **)(v3 + 224), *(void **)(v3 + 232));
      _UITraitCollectionWasCopied(v3, (unint64_t)v5);
      v6 = (void *)*((_QWORD *)v5 + 31);
      if (v6)

      v9 = *(void **)(v3 + 248);
      v8 = v3 + 248;
      v7 = v9;
      if (v9)
        v10 = v7;
      v11 = *(_OWORD *)v8;
      v12 = *(_OWORD *)(v8 + 16);
      *((_QWORD *)v5 + 35) = *(_QWORD *)(v8 + 32);
      *(_OWORD *)(v5 + 248) = v11;
      *(_OWORD *)(v5 + 264) = v12;
      v5[288] |= 1u;
      return v5;
    }
  }
  return result;
}

uint64_t __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  void (*v6)(_QWORD, _QWORD, _QWORD);
  void (*v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t result;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void (*v24[6])(_QWORD, _QWORD, _QWORD);
  void (*v25[4])(_QWORD, _QWORD, _QWORD);
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](*(_QWORD *)(a1 + 32));
  v6 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v25[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v25[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v25[2] = (void (*)(_QWORD, _QWORD, _QWORD))__79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_3;
  v25[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC568;
  v26 = *(_OWORD *)(a1 + 32);
  v27 = a3;
  _UITraitTokenSetEnumerate(v5, v25);
  if (*(_BYTE *)(a1 + 80))
  {
    v7 = (void (*)(_QWORD, _QWORD, _QWORD))-[UITraitCollection _specifiedTraitTokens](*(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 48);
    v24[0] = v6;
    v24[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v24[2] = (void (*)(_QWORD, _QWORD, _QWORD))__79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_4;
    v24[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC590;
    v24[4] = (void (*)(_QWORD, _QWORD, _QWORD))a3;
    v24[5] = v7;
    -[_UITraitTokenSet enumerateAllTraitTokenValues:](v8, v24);
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) != v9)
  {

    v10 = *(id *)(a1 + 56);
    *(_QWORD *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 232) = v10;
  }
  v11 = *(_QWORD *)(a1 + 64);
  if (v11 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) != v11)
  {

    v12 = *(id *)(a1 + 64);
    *(_QWORD *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 240) = v12;
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
  if (result)
  {
    v14 = (id)objc_msgSend(*(id *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 224), "mutableCopy");
    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

    result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    *(_QWORD *)(result + 224) = v14;
  }
  return result;
}

uint64_t __54__UITraitCollection_traitCollectionByModifyingTraits___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isEqualToTraitCollectionForResolvingImage:(uint64_t)a1
{
  uint64_t v2;

  v2 = 0;
  if (a1 && a2)
  {
    if (a1 == a2)
      return 1;
    else
      return *(double *)(a1 + 16) == *(double *)(a2 + 16)
          && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
          && *(_QWORD *)(a1 + 80) == *(_QWORD *)(a2 + 80)
          && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
          && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a2 + 64)
          && *(_QWORD *)(a1 + 72) == *(_QWORD *)(a2 + 72)
          && *(_QWORD *)(a1 + 88) == *(_QWORD *)(a2 + 88)
          && *(_QWORD *)(a1 + 120) == *(_QWORD *)(a2 + 120)
          && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
          && *(_QWORD *)(a1 + 152) == *(_QWORD *)(a2 + 152)
          && *(_QWORD *)(a1 + 104) == *(_QWORD *)(a2 + 104);
  }
  return v2;
}

uint64_t __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!result)
    return *(_QWORD *)(a1 + 32);
  return result;
}

- (UIUserInterfaceStyle)userInterfaceStyle
{
  _UIRecordTraitUsage((unint64_t)self, 1uLL);
  return self->_builtinTraits.userInterfaceStyle;
}

- (int64_t)_vibrancy
{
  _UIRecordTraitUsage((unint64_t)self, 0x16uLL);
  return self->_builtinTraits.vibrancy;
}

- (uint64_t)_descriptionWithPrivateTraits:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  NSString *v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    return objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@>"),
             v6,
             v3,
             -[UITraitCollection _traitsDescriptionMatching:includePrivateTraits:](v3, 0, a2));
  }
  return result;
}

- (uint64_t)_traitsDescriptionMatching:(_BOOL4)a3 includePrivateTraits:
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  _QWORD *v19;
  void *v20;
  BOOL v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  if (result)
  {
    v5 = (_QWORD *)result;
    v6 = result + 8;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = MEMORY[0x1E0C809B0];
    v23[4] = v7;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___UIBuiltinTraitStorageDescription_block_invoke;
    v24[3] = &unk_1E16CBF10;
    v24[4] = v7;
    v22[4] = v7;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___UIBuiltinTraitStorageDescription_block_invoke_2;
    v23[3] = &unk_1E16CBF38;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = ___UIBuiltinTraitStorageDescription_block_invoke_3;
    v22[3] = &unk_1E16CBF60;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
    v18 = &unk_1E16CC710;
    v19 = v24;
    v26[1] = 3221225472;
    v26[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
    v26[3] = &unk_1E16CC738;
    v26[4] = v23;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
    v25[3] = &unk_1E16CC760;
    v25[4] = v22;
    v26[0] = MEMORY[0x1E0C809B0];
    _UIBuiltinTraitStorageEnumeratePairWithBlock(v6, v6, a3, (uint64_t)&v15, (uint64_t)v26, (uint64_t)v25);
    if (v5[28])
    {
      v15 = v8;
      v16 = 3221225472;
      v17 = __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke;
      v18 = &unk_1E16CC1D8;
      v21 = a3;
      v19 = v5;
      v20 = v7;
      _UIPerformWithTraitLock((uint64_t)&v15);
    }
    if (a3)
    {
      if (v5[30])
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TintColor = %@"), v5[30]));
      a3 = v5[29] != 0;
    }
    if (objc_msgSend(a2, "length"))
    {
      v9 = objc_msgSend(a2, "lowercaseString");
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __69__UITraitCollection__traitsDescriptionMatching_includePrivateTraits___block_invoke;
      v14[3] = &unk_1E16CC200;
      v14[4] = v9;
      objc_msgSend(v7, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v14));
      if (a3)
      {
        v10 = objc_msgSend((id)objc_msgSend(CFSTR("_environmentWrapper"), "lowercaseString"), "containsString:", v9);
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        if ((v10 & 1) == 0)
          goto LABEL_15;
LABEL_13:
        v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; %@"), v5[29]);
        return objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, v13);
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
      if (a3)
        goto LABEL_13;
    }
LABEL_15:
    v13 = &stru_1E16EDF20;
    return objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, v13);
  }
  return result;
}

- (id)_traitsDescription
{
  return -[UITraitCollection _traitsDescriptionMatching:](self, "_traitsDescriptionMatching:", 0);
}

- (id)_traitsDescriptionMatching:(id)a3
{
  int has_internal_diagnostics;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  return (id)-[UITraitCollection _traitsDescriptionMatching:includePrivateTraits:]((uint64_t)self, a3, has_internal_diagnostics);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  UIColor *tintColor;
  void *v7;
  uint64_t v8;
  char v9;
  NSDictionary *clientDefinedTraits;
  NSDictionary *v11;
  NSDictionary *v12;
  _QWORD v13[6];
  char v14;
  _QWORD v15[8];
  char v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;

  v5 = MEMORY[0x1E0C809B0];
  v18[4] = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__UITraitCollection_encodeWithCoder___block_invoke;
  v19[3] = &unk_1E16CBF10;
  v19[4] = a3;
  v17[4] = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_2;
  v18[3] = &unk_1E16CBF38;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_3;
  v17[3] = &unk_1E16CBF60;
  v23 = 3221225472;
  v24 = (uint64_t)___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
  v25 = &unk_1E16CC710;
  v26 = v19;
  v21[1] = 3221225472;
  v21[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
  v21[3] = &unk_1E16CC738;
  v21[4] = v18;
  v22 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
  v20[3] = &unk_1E16CC760;
  v20[4] = v17;
  v21[0] = MEMORY[0x1E0C809B0];
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)&self->_builtinTraits, 1, (uint64_t)&v22, (uint64_t)v21, (uint64_t)v20);
  tintColor = self->_tintColor;
  if (tintColor)
    objc_msgSend(a3, "encodeObject:forKey:", tintColor, CFSTR("UITraitCollectionTintColor"));
  if (-[NSDictionary count](self->_clientDefinedTraits, "count"))
  {
    v22 = 0;
    v23 = (uint64_t)&v22;
    v24 = 0x2020000000;
    LOBYTE(v25) = 0;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](self->_clientDefinedTraits, "count"));
    if (qword_1ECD7E798 != -1)
      dispatch_once(&qword_1ECD7E798, &__block_literal_global_646);
    v8 = qword_1ECD7E790;
    v9 = objc_msgSend(a3, "requiresSecureCoding");
    clientDefinedTraits = self->_clientDefinedTraits;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_4;
    v15[3] = &unk_1E16CC310;
    v16 = v9;
    v15[4] = v8;
    v15[5] = a3;
    v15[6] = v7;
    v15[7] = &v22;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](clientDefinedTraits, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("UITraitEncodedKeys"));
    v11 = self->_clientDefinedTraits;
    if (*(_BYTE *)(v23 + 24))
    {
      v11 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_clientDefinedTraits, "count"));
      v12 = self->_clientDefinedTraits;
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_5;
      v13[3] = &unk_1E16CC338;
      v14 = v9;
      v13[4] = v8;
      v13[5] = v11;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v13);
    }
    objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("UITraitCollectionClientDefinedTraits"));
    _Block_object_dispose(&v22, 8);
  }
}

- (unint64_t)hash
{
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___UIBuiltinTraitStorageHash_block_invoke;
  v7[3] = &unk_1E16CBE98;
  v7[4] = &v8;
  v5[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___UIBuiltinTraitStorageHash_block_invoke_2;
  v6[3] = &unk_1E16CBEC0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___UIBuiltinTraitStorageHash_block_invoke_3;
  v5[3] = &unk_1E16CBEE8;
  v14[1] = 3221225472;
  v14[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
  v14[3] = &unk_1E16CC710;
  v14[4] = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
  v13[3] = &unk_1E16CC738;
  v13[4] = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
  v12[3] = &unk_1E16CC760;
  v12[4] = v5;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)&self->_builtinTraits, 1, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12);
  v3 = v9[3];
  _Block_object_dispose(&v8, 8);
  if (-[NSDictionary count](self->_clientDefinedTraits, "count"))
    v3 ^= -[NSDictionary hash](self->_clientDefinedTraits, "hash");
  return -[NSObject hash](self->_environmentWrapper, "hash") ^ v3;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  if (*a2 != a4)
    return objc_msgSend(*(id *)(result + 32), "encodeInteger:forKey:", *a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3));
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_3(uint64_t result, double *a2, uint64_t a3, double a4)
{
  if (*a2 != a4)
    return objc_msgSend(*(id *)(result + 32), "encodeDouble:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3), *a2);
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_2(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  if (*a2 != a4)
    return objc_msgSend(*(id *)(result + 32), "encodeInteger:forKey:", *a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3));
  return result;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3);
  result = objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v5);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", v5);
    *a2 = result;
  }
  return result;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke_3(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3);
  result = objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v5);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "decodeDoubleForKey:", v5);
    *a2 = v7;
  }
  return result;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITraitCollectionBuiltinTrait-%@"), a3);
  result = objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v5);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", v5);
    *a2 = result;
  }
  return result;
}

- (void)performAsCurrentTraitCollection:(void *)actions
{
  +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)self, (uint64_t)actions);
}

void __62__UITraitCollection__systemTraitTokensAffectingImageLookupSet__block_invoke(__n128 a1)
{
  __n128 v1;
  __n128 v2;
  __n128 v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;

  _UITraitTokenSetInsert(qword_1ECD7E7D0, 3uLL, a1);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 0, v1);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 1uLL, v2);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 8uLL, v3);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 4uLL, v4);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 5uLL, v5);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 2uLL, v6);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 0xBuLL, v7);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 0x11uLL, v8);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 7uLL, v9);
  _UITraitTokenSetInsert(qword_1ECD7E7D0, 9uLL, v10);
}

+ (UITraitCollection)traitCollectionWithTraitsFromCollections:(NSArray *)traitCollections
{
  UITraitCollection *v7;
  _QWORD v8[7];

  if (-[NSArray count](traitCollections, "count") == 1)
    return (UITraitCollection *)-[NSArray lastObject](traitCollections, "lastObject");
  v7 = [UITraitCollection alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke;
  v8[3] = &unk_1E16CC4C8;
  v8[5] = a1;
  v8[6] = a2;
  v8[4] = traitCollections;
  return (UITraitCollection *)-[UITraitCollection _initWithTraitMutations:]((char *)v7, (uint64_t)v8);
}

+ (UITraitCollection)traitCollectionWithTraits:(UITraitMutations)mutations
{
  if (!mutations)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITraitCollection_NonARC.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mutations != NULL"));
  return (UITraitCollection *)-[UITraitCollection _initWithTraitMutations:]((char *)[UITraitCollection alloc], (uint64_t)mutations);
}

- (char)_traitCollectionByFilteringTraitTokenSet:(char *)result
{
  char *v3;
  uint64_t *v4;
  UITraitCollection *v5;
  _QWORD v6[7];

  if (result)
  {
    v3 = result;
    v4 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens]((uint64_t)result);
    if (_UITraitTokenSetIsSubsetOfSet(v4, a2))
    {
      return v3;
    }
    else
    {
      v5 = [UITraitCollection alloc];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke;
      v6[3] = &unk_1E16CC000;
      v6[5] = a2;
      v6[6] = v4;
      v6[4] = v3;
      return -[UITraitCollection _initWithTraitMutations:]((char *)v5, (uint64_t)v6);
    }
  }
  return result;
}

- (char)_initWithTraitMutations:(char *)a1
{
  char *v2;
  char *v4;
  void *v5;
  _OWORD *v6;

  v2 = a1;
  if (a1)
  {
    if (!a2)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithTraitMutations_, a1, CFSTR("UITraitCollection_NonARC.m"), 1294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mutations != NULL"));
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:](v2, (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, 0);
    v2 = v4;
    if (v4)
    {
      v6 = v4 + 248;
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v2 + 35) = 0;
      *v6 = 0u;
      *(_OWORD *)(v2 + 264) = 0u;
      v2[288] |= 3u;
      (*(void (**)(uint64_t, char *))(a2 + 16))(a2, v2);
      v2[288] &= ~2u;
    }
  }
  return v2;
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_2;
  v2[3] = &unk_1E16CBFD8;
  v3 = *(_OWORD *)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  _UIPerformWithTraitLock((uint64_t)v2);
}

void __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  __int128 v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__115;
  v35 = __Block_byref_object_dispose__115;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__115;
  v29 = __Block_byref_object_dispose__115;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__115;
  v23 = __Block_byref_object_dispose__115;
  v24 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_2;
  v12[3] = &unk_1E16CC478;
  v5 = *(_QWORD *)(a1 + 48);
  v17 = &v19;
  v18 = v5;
  v13 = *(_OWORD *)(a1 + 32);
  v14 = a2;
  v15 = &v31;
  v16 = &v25;
  _UIPerformWithTraitLock((uint64_t)v12);
  v6 = (void *)a2[30];
  if (v6 != (void *)v26[5])
  {

    a2[30] = (id)v26[5];
  }
  v7 = (void *)a2[29];
  if (v7 != (void *)v20[5])
  {

    a2[29] = (id)v20[5];
  }
  v8 = v32[5];
  if (v8)
  {
    v9 = a2[28];
    if (v9)
    {
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("UITraitCollection_NonARC.m"), 2256, CFSTR("UIKit internal inconsistency: mutable trait collection must have a mutable dictionary _clientDefinedTraits"));
      v10 = (void *)v32[5];
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_6;
      v11[3] = &unk_1E16CC4A0;
      v11[4] = v9;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

    }
    else
    {
      a2[28] = v8;
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

uint64_t __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], *(_QWORD *)(a1 + 32) + 8, *(void **)(*(_QWORD *)(a1 + 32) + 240), 0, *(void **)(*(_QWORD *)(a1 + 32) + 232));
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      _UITraitCollectionWasCopied(*(_QWORD *)(a1 + 32), v3);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 224) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 224), "mutableCopy");
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 248);
      if (v4)

      v5 = -[UITraitCollection _specifiedTraitTokens](*(_QWORD *)(a1 + 32));
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_QWORD *)(v6 + 248) = objc_msgSend(*(id *)v5, "mutableCopy");
      v7 = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(v6 + 256) = *(_OWORD *)(v5 + 8);
      *(_OWORD *)(v6 + 272) = v7;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_BYTE *)(v8 + 288) |= 1u;
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_BYTE *)(v9 + 288) |= 2u;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_specifiedTraitTokens
{
  uint64_t v1;
  __int128 v2;
  _OWORD v3[2];
  uint64_t v4;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 288) & 1) == 0)
    {
      -[UITraitCollection _computeSpecifiedTraitTokensAcquireLock:]((_QWORD *)result, 1, (uint64_t)v3);
      v2 = v3[1];
      *(_OWORD *)(v1 + 248) = v3[0];
      *(_OWORD *)(v1 + 264) = v2;
      *(_QWORD *)(v1 + 280) = v4;
      *(_BYTE *)(v1 + 288) |= 1u;
    }
    return v1 + 248;
  }
  return result;
}

- (char)_initWithBuiltinTraitStorage:(void *)a3 tintColor:(void *)a4 clientDefinedTraits:(void *)a5 environmentWrapper:
{
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v22;

  if (!a1)
    return 0;
  v22.receiver = a1;
  v22.super_class = (Class)UITraitCollection;
  v9 = (char *)objc_msgSendSuper2(&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = *(_OWORD *)a2;
    *(_OWORD *)(v9 + 24) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v9 + 8) = v11;
    v12 = *(_OWORD *)(a2 + 32);
    v13 = *(_OWORD *)(a2 + 48);
    v14 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v9 + 88) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v9 + 72) = v14;
    *(_OWORD *)(v9 + 56) = v13;
    *(_OWORD *)(v9 + 40) = v12;
    v15 = *(_OWORD *)(a2 + 96);
    v16 = *(_OWORD *)(a2 + 112);
    v17 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(v9 + 152) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(v9 + 136) = v17;
    *(_OWORD *)(v9 + 120) = v16;
    *(_OWORD *)(v9 + 104) = v15;
    v18 = *(_OWORD *)(a2 + 160);
    v19 = *(_OWORD *)(a2 + 176);
    v20 = *(_OWORD *)(a2 + 192);
    *((_QWORD *)v9 + 27) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(v9 + 200) = v20;
    *(_OWORD *)(v9 + 184) = v19;
    *(_OWORD *)(v9 + 168) = v18;
    *((_QWORD *)v9 + 30) = a3;
    if (objc_msgSend(a4, "count"))
      *((_QWORD *)v10 + 28) = objc_msgSend(a4, "copy");
    *((_QWORD *)v10 + 29) = a5;
    if ((__int128 *)a2 == &_UIBuiltinTraitStorageUnspecified && !objc_msgSend(a4, "count"))
    {
      *(_OWORD *)(v10 + 248) = 0u;
      *((_QWORD *)v10 + 35) = 0;
      *(_OWORD *)(v10 + 264) = 0u;
      v10[288] |= 1u;
    }
  }
  return v10;
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_3(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  _QWORD v16[5];
  void (*v17[7])(_QWORD, _QWORD, _QWORD);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = NSStringFromSelector(*(SEL *)(a1 + 72));
    objc_msgSend(v13, "raise:format:", v14, CFSTR("Arguments to %@ must all be of type %@"), v15, NSStringFromClass(*(Class *)(a1 + 32)));
  }
  v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a2);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v17[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v17[2] = (void (*)(_QWORD, _QWORD, _QWORD))__62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_4;
  v17[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CBFB0;
  v8 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40);
  v17[4] = (void (*)(_QWORD, _QWORD, _QWORD))a2;
  v17[5] = v8;
  v17[6] = a3;
  _UITraitTokenSetEnumerate(v6, v17);
  v9 = *(void **)(a2 + 224);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_5;
  v16[3] = &unk_1E16CC428;
  v16[4] = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v11 + 40))
    *(_QWORD *)(v11 + 40) = *(_QWORD *)(a2 + 240);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_QWORD *)(v12 + 40))
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(a2 + 232);
  return result;
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  void (*v2[4])(_QWORD, _QWORD, _QWORD);
  __int128 v3;
  uint64_t v4;

  v2[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v2[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v2[2] = (void (*)(_QWORD, _QWORD, _QWORD))__62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_3;
  v2[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CBFB0;
  v1 = *(uint64_t **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 32);
  _UITraitTokenSetEnumerate(v1, v2);
}

- (void)_setValue:(uint64_t)a3 forTraitWithMetadata:(int8x16_t)a4
{
  char v4;
  char v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint16x8_t **v27;
  char v28;
  char v29;
  unint64_t v30;
  NSObject *v31;
  uint8_t buf[4];
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 288) & 2) != 0)
    {
      v9 = *(_QWORD *)a3;
      if (!v5 & v4)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setValue_forBuiltInTraitWithMetadata_, a1, CFSTR("UITraitCollection_NonARC.m"), 902, CFSTR("Invalid built in trait value: %lu"), v9);
        goto LABEL_32;
      }
      switch(v9)
      {
        case 0uLL:
          *(_QWORD *)(a1 + 8) = a2;
          goto LABEL_32;
        case 1uLL:
          *(_QWORD *)(a1 + 80) = a2;
          goto LABEL_32;
        case 2uLL:
          *(_QWORD *)(a1 + 88) = a2;
          goto LABEL_32;
        case 3uLL:
          *(_QWORD *)(a1 + 16) = a2;
          goto LABEL_32;
        case 4uLL:
          *(_QWORD *)(a1 + 64) = a2;
          goto LABEL_32;
        case 5uLL:
          *(_QWORD *)(a1 + 72) = a2;
          goto LABEL_32;
        case 6uLL:
          *(_QWORD *)(a1 + 96) = a2;
          goto LABEL_32;
        case 7uLL:
          buf[0] = 0;
          *(_QWORD *)(a1 + 104) = _UIContentSizeCategoryFromStringInternal(a2, buf);
          goto LABEL_32;
        case 8uLL:
          *(_QWORD *)(a1 + 24) = a2;
          goto LABEL_32;
        case 9uLL:
          *(_QWORD *)(a1 + 152) = a2;
          goto LABEL_32;
        case 0xAuLL:
          *(_QWORD *)(a1 + 160) = a2;
          goto LABEL_32;
        case 0xBuLL:
          *(_QWORD *)(a1 + 120) = a2;
          goto LABEL_32;
        case 0xCuLL:
          *(_QWORD *)(a1 + 184) = a2;
          goto LABEL_32;
        case 0xDuLL:
          *(_QWORD *)(a1 + 216) = a2;
          goto LABEL_32;
        case 0xEuLL:
          *(_QWORD *)(a1 + 32) = a2;
          goto LABEL_32;
        case 0xFuLL:
          *(_QWORD *)(a1 + 40) = a2;
          goto LABEL_32;
        case 0x10uLL:
          *(_QWORD *)(a1 + 48) = a2;
          goto LABEL_32;
        case 0x11uLL:
          *(_QWORD *)(a1 + 56) = a2;
          goto LABEL_32;
        case 0x12uLL:
          *(_QWORD *)(a1 + 112) = a2;
          goto LABEL_32;
        case 0x13uLL:
          *(_QWORD *)(a1 + 128) = a2;
          goto LABEL_32;
        case 0x14uLL:
          *(_QWORD *)(a1 + 136) = a2;
          goto LABEL_32;
        case 0x15uLL:
          *(_QWORD *)(a1 + 144) = a2;
          goto LABEL_32;
        case 0x16uLL:
          *(_QWORD *)(a1 + 168) = a2;
          goto LABEL_32;
        case 0x17uLL:
          *(_QWORD *)(a1 + 176) = a2;
          goto LABEL_32;
        case 0x18uLL:
          *(_QWORD *)(a1 + 192) = a2;
          goto LABEL_32;
        case 0x19uLL:
          *(_QWORD *)(a1 + 200) = a2;
          goto LABEL_32;
        case 0x1AuLL:
          *(_QWORD *)(a1 + 208) = a2;
          goto LABEL_32;
        default:
          v10 = *(_QWORD *)(a3 + 8);
          v11 = *(_QWORD *)(a3 + 16);
          v12 = *(_QWORD *)(a3 + 24);
          v13 = *(_QWORD *)(a3 + 32);
          v14 = *(_QWORD **)(a3 + 40);
          v15 = *(_BYTE *)(a3 + 48);
          v16 = *(id *)(a1 + 224);
          if (v16)
          {
            if ((*(_BYTE *)(a3 + 48) & 1) == 0)
            {
LABEL_14:
              if (v14 == a2)
              {
LABEL_15:
                objc_msgSend(v16, "removeObjectForKey:", v12);
              }
              else
              {
                switch(v10)
                {
                  case 1:
                    goto LABEL_19;
                  case 2:
                    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&a2);
                    goto LABEL_30;
                  case 3:
                    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
                    goto LABEL_30;
                  case 4:
                    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
                    goto LABEL_30;
                  default:
                    goto LABEL_32;
                }
              }
              goto LABEL_32;
            }
          }
          else
          {
            v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            *(_QWORD *)(a1 + 224) = v16;
            if ((v15 & 1) == 0)
              goto LABEL_14;
          }
          switch(v10)
          {
            case 1:
              v14 = (_QWORD *)*v14;
              if (v14 == a2)
                goto LABEL_15;
LABEL_19:
              if (v13)
              {
                if (((*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v13 + 16))(v13, a2, v14) & 1) != 0)
                  goto LABEL_15;
              }
              else if (a2 && v14)
              {
                v19 = objc_msgSend(a2, "isEqual:", v14);
                v20 = a2;
                if (v19)
                  goto LABEL_15;
LABEL_31:
                objc_msgSend(v16, "setObject:forKey:", v20, v12);
LABEL_32:
                v21 = *(_QWORD *)(a3 + 8);
                v23 = *(_QWORD *)(a3 + 32);
                v22 = *(_QWORD **)(a3 + 40);
                if ((*(_BYTE *)(a3 + 48) & 1) != 0)
                {
                  switch(v21)
                  {
                    case 1:
                      v22 = (_QWORD *)*v22;
                      if (v22 != a2)
                        goto LABEL_40;
                      goto LABEL_37;
                    case 2:
                    case 3:
                    case 4:
                      v22 = (_QWORD *)*v22;
                      break;
                    default:
                      v24 = *(_QWORD *)(a3 + 16);
                      v25 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v22);
                      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v24);
                      v22 = 0;
                      break;
                  }
                }
                if (v22 == a2)
                {
LABEL_37:
                  v26 = *(_QWORD *)a3;
                  v27 = (uint16x8_t **)(a1 + 248);
LABEL_38:
                  _UITraitTokenSetRemove(v27, v26, a4);
                  return;
                }
                if (v21 == 1)
                {
LABEL_40:
                  if (v23)
                  {
                    v28 = (*(uint64_t (**)(uint64_t, _QWORD *))(v23 + 16))(v23, a2);
                    goto LABEL_45;
                  }
                  if (a2 && v22)
                  {
                    v28 = objc_msgSend(a2, "isEqual:");
LABEL_45:
                    v29 = v28;
                    v26 = *(_QWORD *)a3;
                    v27 = (uint16x8_t **)(a1 + 248);
                    if ((v29 & 1) != 0)
                      goto LABEL_38;
                    goto LABEL_48;
                  }
                }
                v26 = *(_QWORD *)a3;
                v27 = (uint16x8_t **)(a1 + 248);
LABEL_48:
                _UITraitTokenSetInsert((uint64_t *)v27, v26, (__n128)a4);
                return;
              }
              v20 = a2;
              if (!a2)
              {
                v18 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
LABEL_30:
                v20 = (_QWORD *)v18;
              }
              goto LABEL_31;
            case 2:
            case 3:
            case 4:
              v14 = (_QWORD *)*v14;
              goto LABEL_14;
            default:
              v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v11);
              v14 = 0;
              goto LABEL_14;
          }
      }
    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setValue_forTraitWithMetadata_, a1, CFSTR("UITraitCollection_NonARC.m"), 978, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(sel__setValue_forTraitWithMetadata_));
    }
    else
    {
      v30 = _setValue_forTraitWithMetadata____s_category;
      if (!_setValue_forTraitWithMetadata____s_category)
      {
        v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v30, (unint64_t *)&_setValue_forTraitWithMetadata____s_category);
      }
      v31 = *(NSObject **)(v30 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = NSStringFromSelector(sel__setValue_forTraitWithMetadata_);
        _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
      }
    }
  }
}

- (_QWORD)_computeSpecifiedTraitTokensAcquireLock:(uint64_t)a3@<X8>
{
  _QWORD *v3;
  _BYTE *TraitCollectionTSD;
  unint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  char v12;
  const __CFString *v13;
  __n128 v14;
  __CFString *v15;
  void *v16;
  char v18;
  __int128 v19;
  _QWORD v20[6];
  _QWORD v21[2];
  __int128 v22;
  uint64_t v23;
  __CFString *v24;
  char v25;
  _BYTE v26[7];

  *(_QWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  if (!result)
    return result;
  v3 = result;
  TraitCollectionTSD = GetTraitCollectionTSD();
  v6 = 0;
  v18 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  v7 = &dword_1E16DB719;
  do
  {
    v8 = *(_QWORD *)((char *)v7 - 49);
    v9 = *(_QWORD *)((char *)v7 - 41);
    v10 = *(_QWORD *)((char *)v7 - 17);
    v11 = *(__CFString **)((char *)v7 - 9);
    v12 = *((_BYTE *)v7 - 1);
    *(_DWORD *)v26 = *v7;
    *(_DWORD *)&v26[3] = *(int *)((char *)v7 + 3);
    v21[0] = v8;
    v21[1] = v9;
    v19 = *(_OWORD *)((char *)v7 - 33);
    v22 = v19;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v13 = -[UITraitCollection _valueForBuiltInTraitWithMetadata:](v3, v21);
    v15 = (__CFString *)v13;
    if ((v12 & 1) != 0)
    {
      switch(v9)
      {
        case 1:
          v11 = (__CFString *)v11->isa;
          if (v13 != v11)
            goto LABEL_9;
          break;
        case 2:
        case 3:
        case 4:
          v11 = (__CFString *)v11->isa;
          goto LABEL_7;
        default:
          v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), (_QWORD)v19);
          v11 = 0;
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      if (v11 == v15)
        goto LABEL_16;
      if (v9 != 1)
      {
LABEL_15:
        _UITraitTokenSetInsert((uint64_t *)a3, v6, v14);
        goto LABEL_16;
      }
LABEL_9:
      if (v10)
      {
        if (((*(uint64_t (**)(uint64_t, __CFString *, __CFString *))(v10 + 16))(v10, v15, v11) & 1) == 0)
          goto LABEL_15;
      }
      else if (!v15 || !v11 || (-[__CFString isEqual:](v15, "isEqual:", v11) & 1) == 0)
      {
        goto LABEL_15;
      }
    }
LABEL_16:
    v7 += 14;
    ++v6;
  }
  while (v6 != 27);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke;
  v20[3] = &unk_1E16CC028;
  v20[4] = v3;
  v20[5] = a3;
  if ((a2 & 1) != 0)
    _UIPerformWithTraitLock((uint64_t)v20);
  else
    __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke((uint64_t)v20);
  result = GetTraitCollectionTSD();
  *((_BYTE *)result + 9) = v18;
  return result;
}

uint64_t __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFNumber *v9;
  __n128 v10;
  unint64_t v11;
  const __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _OWORD v23[3];
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (result)
  {
    v5 = result;
    v6 = &_MergedGlobals_1290;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v3);
        v9 = (const __CFNumber *)objc_msgSend((id)v6[418], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8));
        if (v9)
        {
          v28 = 0;
          v26 = 0u;
          v27 = 0u;
          v25 = 0u;
          _UIGetTraitMetadataLocked(v9, 0, (uint64_t)&v25);
          if (!*((_QWORD *)&v25 + 1))
            goto LABEL_22;
          v11 = *(_QWORD *)(a1 + 32);
          v23[0] = v25;
          v23[1] = v26;
          v23[2] = v27;
          v24 = v28;
          v12 = -[UITraitCollection _valueForTraitWithMetadata:](v11, (uint64_t)v23);
          v13 = (__CFString *)v12;
          v14 = *((_QWORD *)&v25 + 1);
          v15 = (__CFString *)*((_QWORD *)&v27 + 1);
          v16 = v27;
          if ((v28 & 1) != 0)
          {
            switch(*((_QWORD *)&v25 + 1))
            {
              case 1:
                v15 = (__CFString *)**((_QWORD **)&v27 + 1);
                if (v12 != **((const __CFString ***)&v27 + 1))
                  goto LABEL_16;
                break;
              case 2:
              case 3:
              case 4:
                v15 = (__CFString *)**((_QWORD **)&v27 + 1);
                goto LABEL_14;
              default:
                v22 = v26;
                v17 = v3;
                v18 = v1;
                v19 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *((_QWORD *)&v27 + 1));
                v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)");
                v21 = (void *)v19;
                v1 = v18;
                v3 = v17;
                v6 = &_MergedGlobals_1290;
                objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v22);
                v15 = 0;
                goto LABEL_14;
            }
          }
          else
          {
LABEL_14:
            if (v15 == v13)
              goto LABEL_23;
            if (v14 != 1)
            {
LABEL_22:
              _UITraitTokenSetInsert(*(uint64_t **)(a1 + 40), v25, v10);
              goto LABEL_23;
            }
LABEL_16:
            if (v16)
            {
              if (((*(uint64_t (**)(uint64_t, __CFString *))(v16 + 16))(v16, v13) & 1) == 0)
                goto LABEL_22;
            }
            else if (!v13 || !v15 || (-[__CFString isEqual:](v13, "isEqual:") & 1) == 0)
            {
              goto LABEL_22;
            }
          }
        }
LABEL_23:
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

+ (UITraitCollection)currentTraitCollection
{
  return (UITraitCollection *)+[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 1);
}

- (UILegibilityWeight)legibilityWeight
{
  _UIRecordTraitUsage((unint64_t)self, 0xBuLL);
  return self->_builtinTraits.legibilityWeight;
}

- (int64_t)_userInterfaceRenderingMode
{
  _UIRecordTraitUsage((unint64_t)self, 0x17uLL);
  return self->_builtinTraits.userInterfaceRenderingMode;
}

- (BOOL)hasDifferentColorAppearanceComparedToTraitCollection:(UITraitCollection *)traitCollection
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;

  if (self == traitCollection)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (!traitCollection)
    goto LABEL_11;
  LODWORD(v5) = dyld_program_sdk_at_least();
  if ((_DWORD)v5)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
      goto LABEL_9;
    v6 = -[UITraitCollection _tintColor](self, "_tintColor");
    v5 = -[UITraitCollection _tintColor](traitCollection, "_tintColor");
    if (v6 == v5)
      goto LABEL_9;
    v7 = v5;
    LOBYTE(v5) = 1;
    if (v6)
    {
      if (v7)
      {
        if (-[UIColor isEqual:](v6, "isEqual:"))
        {
LABEL_9:
          LOBYTE(v5) = _colorAppearanceTraitChanged((uint64_t)self, (uint64_t)traitCollection);
          return (char)v5;
        }
LABEL_11:
        LOBYTE(v5) = 1;
      }
    }
  }
  return (char)v5;
}

- (int64_t)_focusSystemState
{
  _UIRecordTraitUsage((unint64_t)self, 0x18uLL);
  return self->_builtinTraits.focusSystemState;
}

+ (BOOL)_isPlaceholderTraitToken:(id)a3
{
  _OWORD v4[3];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)v4);
  return *((_QWORD *)&v4[0] + 1) == 0;
}

- (BOOL)_isTraitTokenSpecified:(id)a3
{
  const __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  void *v12;
  char v13;
  _OWORD v14[3];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v9 = _UIGetTraitTokenValue((const __CFNumber *)a3);
    return _UITraitTokenSetContains((uint16x8_t **)&self->_specifiedTraitTokens, v9);
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)&v16);
    if (*((_QWORD *)&v16 + 1))
    {
      v14[0] = v16;
      v14[1] = v17;
      v14[2] = v18;
      v15 = v19;
      v4 = -[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v14);
      v5 = (__CFString *)v4;
      v6 = *((_QWORD *)&v16 + 1);
      v7 = (__CFString *)*((_QWORD *)&v18 + 1);
      v8 = v18;
      if ((v19 & 1) != 0)
      {
        switch(*((_QWORD *)&v16 + 1))
        {
          case 1:
            v7 = (__CFString *)**((_QWORD **)&v18 + 1);
            if (v4 != **((const __CFString ***)&v18 + 1))
              goto LABEL_12;
            goto LABEL_10;
          case 2:
          case 3:
          case 4:
            v7 = (__CFString *)**((_QWORD **)&v18 + 1);
            break;
          default:
            v11 = v17;
            v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *((_QWORD *)&v18 + 1));
            objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v11);
            v7 = 0;
            break;
        }
      }
      if (v7 == v5)
      {
LABEL_10:
        v13 = 1;
      }
      else if (v6 == 1)
      {
LABEL_12:
        if (v8)
        {
          v13 = (*(uint64_t (**)(uint64_t, __CFString *))(v8 + 16))(v8, v5);
        }
        else
        {
          v13 = 0;
          if (v5)
          {
            if (v7)
              v13 = -[__CFString isEqual:](v5, "isEqual:");
          }
        }
      }
      else
      {
        v13 = 0;
      }
      return v13 ^ 1;
    }
    else
    {
      return -[NSDictionary objectForKey:](self->_clientDefinedTraits, "objectForKey:", *((_QWORD *)&v17 + 1)) != 0;
    }
  }
}

+ (uint64_t)_emptyTraitCollection
{
  objc_opt_self();
  if (qword_1ECD7E778 != -1)
    dispatch_once(&qword_1ECD7E778, &__block_literal_global_287);
  return qword_1ECD7E770;
}

- (id)_changedTraitTokensArrayFromTraitCollection:(id)a3
{
  void *v3;
  int8x16_t *v4;
  void (*v5)(_QWORD, _QWORD, _QWORD);
  void (*v7[5])(_QWORD, _QWORD, _QWORD);
  int8x16_t v8[3];

  memset(v8, 0, 40);
  -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)self, (uint64_t)a3, (uint64_t)v8);
  v3 = (void *)MEMORY[0x1E0C99DE8];
  if (v8[0].i64[0])
    v4 = -[_UIFastIndexSet count]((int8x16_t *)v8[0].i64[0]);
  else
    v4 = (int8x16_t *)vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v8 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)&v8[1] + 8))))));
  v5 = (void (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(v3, "arrayWithCapacity:", v4);
  v7[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v7[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD, _QWORD))__65__UITraitCollection__changedTraitTokensArrayFromTraitCollection___block_invoke;
  v7[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC810;
  v7[4] = v5;
  _UITraitTokenSetEnumerate(v8[0].i64, v7);
  if (v8[0].i64[0])

  return v5;
}

- (id)_traitCollectionByRemovingTraitToken:(id)a3
{
  uint64_t v4;
  int has_internal_diagnostics;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)&v13);
  if (*((_QWORD *)&v13 + 1))
  {
    v4 = *((_QWORD *)&v15 + 1);
    if ((v16 & 1) != 0)
    {
      switch(*((_QWORD *)&v13 + 1))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          v4 = **((_QWORD **)&v15 + 1);
          break;
        default:
          v8 = v14;
          v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v8);
          v4 = 0;
          break;
      }
    }
    *(_OWORD *)buf = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, v4, (__int128 *)buf);
  }
  else
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v7 = -[NSDictionary objectForKey:](self->_clientDefinedTraits, "objectForKey:", *((_QWORD *)&v14 + 1));
    if (has_internal_diagnostics)
    {
      if (v7)
      {
        v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v14;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Removing placeholder trait (%@) is not supported", buf, 0xCu);
        }
      }
    }
    else if (v7)
    {
      v11 = _traitCollectionByRemovingTraitToken____s_category;
      if (!_traitCollectionByRemovingTraitToken____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&_traitCollectionByRemovingTraitToken____s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Removing placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
    return self;
  }
}

+ (id)_existingTraitTokenReservingPlaceholderIfNecessaryWithName:(id)a3 identifier:(id)a4
{
  _QWORD v5[7];

  v5[0] = 0;
  v5[1] = 0;
  v5[2] = a3;
  v5[3] = a4;
  memset(&v5[4], 0, 24);
  return _UIDefineNewTrait((uint64_t)v5);
}

uint64_t __29__UITraitCollection_isEqual___block_invoke_2(uint64_t a1, uint64_t a2, __CFString *a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v9;
  const __CFNumber *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  result = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  if (!result)
    goto LABEL_11;
  v9 = result;
  v10 = (const __CFNumber *)objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!v10
    || (v23 = 0,
        v21 = 0u,
        v22 = 0u,
        v20 = 0u,
        _UIGetTraitMetadataLocked(v10, 0, (uint64_t)&v20),
        !*((_QWORD *)&v20 + 1)))
  {
    v15 = a3;
    v14 = v9;
    goto LABEL_10;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v20;
  v17 = v21;
  v18 = v22;
  v19 = v23;
  v12 = -[UITraitCollection _valueForTraitWithMetadata:](v11, (uint64_t)&v16);
  v13 = *(_QWORD *)(a1 + 48);
  v16 = v20;
  v17 = v21;
  v18 = v22;
  v19 = v23;
  result = (uint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v13, (uint64_t)&v16);
  if (v12 == (const __CFString *)result)
    goto LABEL_12;
  if (*((_QWORD *)&v20 + 1) != 1)
    goto LABEL_11;
  v14 = result;
  result = v22;
  if (!(_QWORD)v22)
  {
    if (!v12 || !v14)
      goto LABEL_11;
    v15 = (__CFString *)v12;
LABEL_10:
    result = -[__CFString isEqual:](v15, "isEqual:", v14);
    if ((result & 1) != 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  result = (*(uint64_t (**)(void))(v22 + 16))();
  if ((result & 1) == 0)
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_12:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
  return result;
}

- (_QWORD)_enumerateThemeKeysForLookup:(_QWORD *)result
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  const __CFNumber *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  BOOL v27;
  char v28;
  char v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  _BOOL8 v41;
  char v42;
  _BYTE v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = 0;
    v31 = result[1];
    v48[0] = v31;
    v48[1] = -1;
    v47[0] = result[10];
    v47[1] = 0;
    v36 = result[19];
    v43[0] = v36 == 1;
    v43[1] = 0;
    v39 = result[3];
    v46[0] = v39;
    v46[1] = 0;
    v33 = v47[0];
    if (v47[0] == 2)
      v4 = result[20] == 1;
    v41 = v4;
    v45[0] = v4;
    v45[1] = 0;
    v5 = (void *)objc_opt_self();
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    v6 = _UITraitTokenForTraitLocked(3, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    v7 = objc_msgSend(v3, "_valueForNSIntegerTraitToken:", v6);
    v8 = 0;
    v44[0] = v7 == 1;
    v44[1] = 0;
    v32 = 1;
LABEL_5:
    v9 = 0;
    v10 = (4 * v48[v8] + 4) & 0x3C;
    v35 = 1;
    v34 = v10;
LABEL_6:
    v11 = 0;
    v12 = v47[v9];
    if (v12 == 1000)
      v13 = 2;
    else
      v13 = v12;
    v14 = v13 & 3 | v10;
    v38 = 1;
    v37 = v14;
LABEL_10:
    v15 = 0;
    v16 = v14 | ((unint64_t)v43[v11] << 6);
    v17 = 1;
LABEL_11:
    v40 = v17;
    v18 = 0;
    v19 = v16 | ((unint64_t)(v46[v15] == 1) << 7);
    v20 = 1;
LABEL_12:
    v21 = 0;
    v22 = (v45[v18] & 1) << 8;
    if (v13 != 2)
      v22 = 0;
    v23 = v19 | v22;
    v24 = 1;
    while (1)
    {
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 | ((unint64_t)(v44[v21] == 1) << 9));
      v42 = 0;
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, v25, &v42);
      if (v42)
        break;
      v26 = (v7 != 1) | ~v24;
      v21 = 1;
      v24 = 0;
      if ((v26 & 1) != 0)
      {
        v27 = v41 & v20;
        v18 = 1;
        v20 = 0;
        if (v27)
          goto LABEL_12;
        v15 = 1;
        v17 = 0;
        if (((v39 != 0) & v40) != 0)
          goto LABEL_11;
        v14 = v37;
        v28 = (v36 == 1) & v38;
        v11 = 1;
        v38 = 0;
        if ((v28 & 1) != 0)
          goto LABEL_10;
        v10 = v34;
        v29 = (v33 != 0) & v35;
        v9 = 1;
        v35 = 0;
        if ((v29 & 1) == 0)
        {
          v30 = (v31 != -1) & v32;
          v8 = 1;
          v32 = 0;
          if ((v30 & 1) != 0)
            goto LABEL_5;
          return result;
        }
        goto LABEL_6;
      }
    }
  }
  return result;
}

- (UIContentSizeCategory)preferredContentSizeCategory
{
  _UIRecordTraitUsage((unint64_t)self, 7uLL);
  return (UIContentSizeCategory)_NSStringFromUIContentSizeCategory(self->_builtinTraits.preferredContentSizeCategory);
}

+ (id)_traitTokensIncludingPlaceholdersForTraits:(uint64_t)a1
{
  void *v3;
  _QWORD v5[6];

  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__UITraitCollection__traitTokensIncludingPlaceholdersForTraits___block_invoke;
  v5[3] = &unk_1E16C3CF0;
  v5[4] = a2;
  v5[5] = v3;
  _UIPerformWithTraitLock((uint64_t)v5);
  return v3;
}

- (void)dealloc
{
  _UIMutableFastIndexSet *set;
  objc_super v4;

  set = self->_specifiedTraitTokens.set;
  if (set)

  v4.receiver = self;
  v4.super_class = (Class)UITraitCollection;
  -[UITraitCollection dealloc](&v4, sel_dealloc);
}

- (double)displayCornerRadius
{
  _UIRecordTraitUsage((unint64_t)self, 0x12uLL);
  return self->_builtinTraits.displayCornerRadius;
}

- (__CFString)_styleEffectAppearanceName
{
  if (result)
  {
    if (-[__CFString userInterfaceStyle](result, "userInterfaceStyle") == 2)
      return CFSTR("UIAppearanceDark");
    else
      return CFSTR("UIAppearanceLight");
  }
  return result;
}

+ (id)_traitCollectionWithBackgroundLevel:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", a3);
}

- (NSObject)_environmentWrapper
{
  return self->_environmentWrapper;
}

- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  int8x16_t v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  -[UITraitCollection _setValue:forTraitWithMetadata:]((uint64_t)self, (_QWORD *)a3, (uint64_t)v6, v10);
}

- (void)setDisplayGamut:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.displayGamut = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 8uLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 8uLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2474, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setDisplayGamut____s_category;
    if (!setDisplayGamut____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setDisplayGamut____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceIdiom = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2444, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setUserInterfaceIdiom____s_category;
    if (!setUserInterfaceIdiom____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setUserInterfaceIdiom____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  int8x16_t v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  -[UITraitCollection _setValue:forTraitWithMetadata:]((uint64_t)self, (_QWORD *)a3, (uint64_t)v6, v10);
}

- (void)setDisplayScale:(double)a3
{
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.displayScale = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == 0.0)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 3uLL, *(int8x16_t *)&a3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 3uLL, *(__n128 *)&a3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2466, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v6 = setDisplayScale____s_category;
    if (!setDisplayScale____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&setDisplayScale____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  __n128 v3;
  uint64_t *p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceStyle = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 1uLL, v3);
    else
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 1uLL, (int8x16_t)v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2489, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setUserInterfaceStyle____s_category;
    if (!setUserInterfaceStyle____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setUserInterfaceStyle____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setAccessibilityContrast:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.accessibilityContrast = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 9uLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 9uLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2532, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setAccessibilityContrast____s_category;
    if (!setAccessibilityContrast____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setAccessibilityContrast____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.layoutDirection = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 2uLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 2uLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2494, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setLayoutDirection____s_category;
    if (!setLayoutDirection____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setLayoutDirection____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceLevel = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xAuLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xAuLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2537, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setUserInterfaceLevel____s_category;
    if (!setUserInterfaceLevel____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setUserInterfaceLevel____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setObject:(id)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  int8x16_t v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  -[UITraitCollection _setValue:forTraitWithMetadata:]((uint64_t)self, a3, (uint64_t)v6, v10);
}

- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  int8x16_t v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  -[UITraitCollection _setValue:forTraitWithMetadata:]((uint64_t)self, *(_QWORD **)&a3, (uint64_t)v6, v10);
}

- (void)setActiveAppearance:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.activeAppearance = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xCuLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xCuLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2514, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setActiveAppearance____s_category;
    if (!setActiveAppearance____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setActiveAppearance____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  -[UITraitCollection _setObject:forTraitToken:](self, "_setObject:forTraitToken:", a3, 0x1E1A99540);
}

- (void)setLegibilityWeight:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.legibilityWeight = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xBuLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xBuLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2506, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setLegibilityWeight____s_category;
    if (!setLegibilityWeight____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setLegibilityWeight____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setForceTouchCapability:(int64_t)a3
{
  __n128 v3;
  uint64_t *p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.forceTouchCapability = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 6uLL, v3);
    else
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 6uLL, (int8x16_t)v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2499, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setForceTouchCapability____s_category;
    if (!setForceTouchCapability____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setForceTouchCapability____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  __n128 v3;
  uint64_t *p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.verticalSizeClass = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 5uLL, v3);
    else
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 5uLL, (int8x16_t)v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2484, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setVerticalSizeClass____s_category;
    if (!setVerticalSizeClass____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setVerticalSizeClass____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  __n128 v3;
  uint64_t *p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.horizontalSizeClass = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 4uLL, v3);
    else
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 4uLL, (int8x16_t)v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2479, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setHorizontalSizeClass____s_category;
    if (!setHorizontalSizeClass____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setHorizontalSizeClass____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setNSIntegerValue:(int64_t)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    v7 = _UITraitTokenForTraitLocked(3, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    -[UITraitCollection _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, v7);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 539, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v9 = setNSIntegerValue_forTrait____s_category;
    if (!setNSIntegerValue_forTrait____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&setNSIntegerValue_forTrait____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setSceneCaptureState:(int64_t)a3
{
  -[UITraitCollection setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_self());
}

+ (uint64_t)_traitCollectionWithTintColor:(uint64_t)a1
{
  void *v3;
  char *v4;
  char *v5;

  objc_opt_self();
  if (!a2)
    return +[UITraitCollection _emptyTraitCollection]();
  os_unfair_lock_lock(&stru_1ECD7E484);
  v3 = (void *)qword_1ECD7E768;
  if (!qword_1ECD7E768)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 2);
    qword_1ECD7E768 = (uint64_t)v3;
  }
  v4 = (char *)objc_msgSend(v3, "objectForKey:", a2);
  if (!v4)
  {
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, a2, 0, 0);
    objc_msgSend((id)qword_1ECD7E768, "setObject:forKey:", v4, a2);
    v5 = v4;
  }
  os_unfair_lock_unlock(&stru_1ECD7E484);
  return (uint64_t)v4;
}

- (UITraitCollection)traitCollectionByModifyingTraits:(UITraitMutations)mutations
{
  _QWORD v6[5];

  if (!mutations)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mutations != NULL"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__UITraitCollection_traitCollectionByModifyingTraits___block_invoke;
  v6[3] = &unk_1E16CBF88;
  v6[4] = mutations;
  return (UITraitCollection *)-[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](self, (uint64_t)v6);
}

- (_QWORD)_themeKey
{
  if (result)
    return (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _UIThemeKeyValueFromTraitCollection(result));
  return result;
}

- (BOOL)containsTraitsInCollection:(UITraitCollection *)trait
{
  return -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)self, (uint64_t)trait);
}

- (id)_objectForTraitToken:(id)a3
{
  _OWORD v5[3];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 1uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v6 = v10;
  return (id)-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

- (id)objectForTrait:(UIObjectTrait)trait
{
  const __CFNumber *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _objectForTraitToken:](self, "_objectForTraitToken:", v5);
}

- (NSString)typesettingLanguage
{
  return (NSString *)-[UITraitCollection objectForTrait:](self, "objectForTrait:", objc_opt_self());
}

- (double)_valueForCGFloatTraitToken:(id)a3
{
  _OWORD v5[3];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 2uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v6 = v10;
  return COERCE_DOUBLE(-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5));
}

- (CGFloat)valueForCGFloatTrait:(UICGFloatTrait)trait
{
  const __CFNumber *v5;
  CGFloat result;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  -[UITraitCollection _valueForCGFloatTraitToken:](self, "_valueForCGFloatTraitToken:", v5);
  return result;
}

- (double)_typesettingLanguageAwareLineHeightRatio
{
  double result;

  -[UITraitCollection valueForCGFloatTrait:](self, "valueForCGFloatTrait:", objc_opt_self());
  return result;
}

- (int64_t)_backlightLuminance
{
  _UIRecordTraitUsage((unint64_t)self, 0x1AuLL);
  return self->_builtinTraits.backlightLuminance;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_splitViewControllerContext
{
  _UIRecordTraitUsage((unint64_t)self, 0x15uLL);
  return self->_builtinTraits.splitViewControllerContext;
}

- (BOOL)_hasSplitViewControllerContextSidebarColumn
{
  _UIRecordTraitUsage((unint64_t)self, 0x15uLL);
  return self->_builtinTraits.splitViewControllerContext == 3
      || -[UITraitCollection _hasSplitViewControllerContextPrimaryColumn](self, "_hasSplitViewControllerContextPrimaryColumn");
}

- (BOOL)_hasSplitViewControllerContextPrimaryColumn
{
  _UIRecordTraitUsage((unint64_t)self, 0x15uLL);
  return (unint64_t)(self->_builtinTraits.splitViewControllerContext - 1) < 2;
}

+ (UITraitCollection)traitCollectionWithPreferredContentSizeCategory:(UIContentSizeCategory)preferredContentSizeCategory
{
  uint64_t v3;
  UITraitCollection *result;
  char *v5;
  void *v6;
  uint64_t *v7;
  _OWORD v8[6];
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  LOBYTE(v8[0]) = 0;
  v3 = _UIContentSizeCategoryFromStringInternal(preferredContentSizeCategory, v8);
  switch(v3)
  {
    case 0:
      result = (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
      break;
    case 1:
      if (qword_1ECD7E6B0 != -1)
        dispatch_once(&qword_1ECD7E6B0, &__block_literal_global_247_0);
      result = (UITraitCollection *)qword_1ECD7E6A8;
      break;
    case 2:
      if (qword_1ECD7E6C0 != -1)
        dispatch_once(&qword_1ECD7E6C0, &__block_literal_global_250_0);
      result = (UITraitCollection *)qword_1ECD7E6B8;
      break;
    case 3:
      if (qword_1ECD7E6D0 != -1)
        dispatch_once(&qword_1ECD7E6D0, &__block_literal_global_253_1);
      result = (UITraitCollection *)qword_1ECD7E6C8;
      break;
    case 4:
      if (qword_1ECD7E6E0 != -1)
        dispatch_once(&qword_1ECD7E6E0, &__block_literal_global_256_0);
      result = (UITraitCollection *)qword_1ECD7E6D8;
      break;
    case 5:
      if (qword_1ECD7E6F0 != -1)
        dispatch_once(&qword_1ECD7E6F0, &__block_literal_global_259_1);
      result = (UITraitCollection *)qword_1ECD7E6E8;
      break;
    case 6:
      if (qword_1ECD7E700 != -1)
        dispatch_once(&qword_1ECD7E700, &__block_literal_global_262);
      result = (UITraitCollection *)qword_1ECD7E6F8;
      break;
    case 7:
      if (qword_1ECD7E710 != -1)
        dispatch_once(&qword_1ECD7E710, &__block_literal_global_265_0);
      result = (UITraitCollection *)qword_1ECD7E708;
      break;
    default:
      switch(v3)
      {
        case 65536:
          if (qword_1ECD7E720 != -1)
            dispatch_once(&qword_1ECD7E720, &__block_literal_global_268);
          result = (UITraitCollection *)qword_1ECD7E718;
          break;
        case 65537:
          if (qword_1ECD7E730 != -1)
            dispatch_once(&qword_1ECD7E730, &__block_literal_global_271);
          result = (UITraitCollection *)qword_1ECD7E728;
          break;
        case 65538:
          if (qword_1ECD7E740 != -1)
            dispatch_once(&qword_1ECD7E740, &__block_literal_global_274);
          result = (UITraitCollection *)qword_1ECD7E738;
          break;
        case 65539:
          if (qword_1ECD7E750 != -1)
            dispatch_once(&qword_1ECD7E750, &__block_literal_global_277);
          result = (UITraitCollection *)qword_1ECD7E748;
          break;
        case 65540:
          if (qword_1ECD7E760 != -1)
            dispatch_once(&qword_1ECD7E760, &__block_literal_global_280);
          result = (UITraitCollection *)qword_1ECD7E758;
          break;
        default:
          v14 = xmmword_1866823F8;
          v15 = unk_186682408;
          v16 = xmmword_186682418;
          v17 = -1;
          v10 = 0xBFF0000000000000;
          v11 = unk_1866823C8;
          v12 = xmmword_1866823D8;
          v13 = unk_1866823E8;
          memset(&v8[2], 0, 48);
          v8[5] = unk_1866823A8;
          v8[0] = _UIBuiltinTraitStorageUnspecified;
          v8[1] = unk_186682368;
          v9 = v3;
          v5 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v8, 0, 0, 0);
          v7 = (uint64_t *)(v5 + 248);
          v6 = (void *)*((_QWORD *)v5 + 31);
          if (v6)

          *((_QWORD *)v5 + 35) = 0;
          *(_OWORD *)v7 = 0u;
          *(_OWORD *)(v5 + 264) = 0u;
          _UITraitTokenSetInsert(v7, 7uLL, (__n128)0);
          v5[288] |= 1u;
          result = v5;
          break;
      }
      break;
  }
  return result;
}

+ (id)_currentTraitCollection
{
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 1);
}

- (void)_setTintColor:(id)a3
{
  UIColor *tintColor;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    tintColor = self->_tintColor;
    if (tintColor != a3)
    {

      self->_tintColor = (UIColor *)a3;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2762, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = _setTintColor____s_category;
    if (!_setTintColor____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_setTintColor____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (unint64_t)primaryInteractionModel
{
  _UIRecordTraitUsage((unint64_t)self, 0x10uLL);
  return self->_builtinTraits.primaryInteractionModel;
}

+ (id)_traitCollectionWithFocusSystemState:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[11];
  uint64_t v8;
  int64_t v9;
  __int128 v10;
  uint64_t v11;

  if (a3 == -1)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  v7[10] = xmmword_1866823F8;
  v8 = unk_186682408;
  v10 = xmmword_186682418;
  v11 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = unk_186682368;
  v9 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x18uLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

- (id)_traitCollectionByReplacingCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  __int128 v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, *(uint64_t *)&a3, v7);
}

- (UIForceTouchCapability)forceTouchCapability
{
  _UIRecordTraitUsage((unint64_t)self, 6uLL);
  return self->_builtinTraits.forceTouchCapability;
}

- (int64_t)_updateFidelity
{
  void *v3;
  int64_t v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", v3);

  return v4;
}

- (NSInteger)valueForNSIntegerTrait:(UINSIntegerTrait)trait
{
  const __CFNumber *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", v5);
}

void __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_4(_QWORD *a1, unint64_t a2)
{
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  int8x16_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  int8x16_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  int8x16_t v19;
  uint64_t v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  if (*((_QWORD *)&v17 + 1))
  {
    if ((v20 & 2) != 0)
    {
      v4 = a1[5];
      if ((_QWORD)v17 == 15)
      {
        v13 = v17;
        v14 = v18;
        v15 = v19;
        v16 = v20;
        v5 = -[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)&v13);
        v6 = a1[4];
        v13 = v17;
        v14 = v18;
        v15 = v19;
        v16 = v20;
        v7 = -[UITraitCollection _valueForTraitWithMetadata:](v6, (uint64_t)&v13);
        v8 = a1[5];
        v9 = (__CFString *)((unint64_t)v7 | (unint64_t)v5);
        v13 = v17;
        v14 = v18;
        v10 = v19;
        v15 = v19;
        v16 = v20;
        v11 = v8;
LABEL_9:
        -[UITraitCollection _setValue:forTraitWithMetadata:](v11, v9, (uint64_t)&v13, v10);
        return;
      }
      if ((_UITraitTokenSetContains((uint16x8_t **)(v4 + 248), a2) & 1) != 0)
        return;
    }
    else if (a1[6])
    {
      return;
    }
    v12 = a1[4];
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v9 = (__CFString *)-[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13);
    v11 = a1[5];
    v13 = v17;
    v14 = v18;
    v10 = v19;
    v15 = v19;
    v16 = v20;
    goto LABEL_9;
  }
}

- (void)_setEnvironmentWrapper:(id)a3
{
  NSObject *environmentWrapper;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    environmentWrapper = self->_environmentWrapper;
    if (environmentWrapper != a3)
    {

      self->_environmentWrapper = a3;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2799, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = _setEnvironmentWrapper____s_category;
    if (!_setEnvironmentWrapper____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_setEnvironmentWrapper____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (id)_traitCollectionWithIncrementedBackgroundLevel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if ((dyld_program_sdk_at_least() & 1) != 0
      && ((v2 = objc_msgSend(v1, "userInterfaceLevel"), v2 != -1) ? (v3 = v2) : (v3 = 0), v3 <= 0))
    {
      return (id)objc_msgSend(v1, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", v3 + 1, 0x1E1A99588);
    }
    else
    {
      return v1;
    }
  }
  return result;
}

- (UIUserInterfaceLevel)userInterfaceLevel
{
  _UIRecordTraitUsage((unint64_t)self, 0xAuLL);
  return self->_builtinTraits.userInterfaceLevel;
}

+ (const)_traitTokenForNSIntegerTrait:(uint64_t)a1
{
  const __CFNumber *v3;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v3 = _UITraitTokenForTraitLocked(3, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

- (id)_traitCollectionByRemovingEnvironmentWrapper
{
  char *v3;
  void *v4;
  _UIMutableFastIndexSet *v5;
  $02821A8335BA3EC4424B6F1A0FE3F522 *p_specifiedTraitTokens;
  _UIMutableFastIndexSet *set;
  _UIMutableFastIndexSet *v8;
  __int128 v9;
  __int128 v10;

  if (self->_environmentWrapper)
  {
    v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&self->_builtinTraits, self->_tintColor, self->_clientDefinedTraits, 0);
    _UITraitCollectionWasCopied((unint64_t)self, (unint64_t)v3);
    v4 = (void *)*((_QWORD *)v3 + 31);
    if (v4)

    set = self->_specifiedTraitTokens.set;
    p_specifiedTraitTokens = &self->_specifiedTraitTokens;
    v5 = set;
    if (set)
      v8 = v5;
    v9 = *(_OWORD *)&p_specifiedTraitTokens->set;
    v10 = *(_OWORD *)&p_specifiedTraitTokens->bitSet[1];
    *((_QWORD *)v3 + 35) = p_specifiedTraitTokens->bitSet[3];
    *(_OWORD *)(v3 + 248) = v9;
    *(_OWORD *)(v3 + 264) = v10;
    v3[288] |= 1u;
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (BOOL)_isLargeContentViewerEnabled
{
  _BOOL4 v3;

  v3 = +[UILargeContentViewerInteraction isEnabled](UILargeContentViewerInteraction, "isEnabled");
  if (v3)
    LOBYTE(v3) = (unint64_t)-[UITraitCollection userInterfaceIdiom](self, "userInterfaceIdiom") < UIUserInterfaceIdiomTV;
  return v3;
}

- (int64_t)_presentationSemanticContext
{
  _UIRecordTraitUsage((unint64_t)self, 0x14uLL);
  return self->_builtinTraits.presentationSemanticContext;
}

+ (UITraitCollection)traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[4];
  uint64_t v8;
  UIUserInterfaceStyle v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  switch(userInterfaceStyle)
  {
    case UIUserInterfaceStyleUnspecified:
      return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
    case UIUserInterfaceStyleDark:
      if (qword_1ECD7E5F0 != -1)
        dispatch_once(&qword_1ECD7E5F0, &__block_literal_global_199);
      return (UITraitCollection *)qword_1ECD7E5E8;
    case UIUserInterfaceStyleLight:
      if (qword_1ECD7E5E0 != -1)
        dispatch_once(&qword_1ECD7E5E0, &__block_literal_global_196_0);
      return (UITraitCollection *)qword_1ECD7E5D8;
    default:
      v15 = xmmword_1866823F8;
      v16 = unk_186682408;
      v17 = xmmword_186682418;
      v18 = -1;
      v11 = xmmword_1866823B8;
      v12 = unk_1866823C8;
      v13 = xmmword_1866823D8;
      v14 = unk_1866823E8;
      memset(&v7[2], 0, 32);
      v8 = 0;
      v10 = unk_1866823A8;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186682368;
      v9 = userInterfaceStyle;
      v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      v6 = (uint64_t *)(v4 + 248);
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v4 + 35) = 0;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 1uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
  }
}

+ (uint64_t)_performWithCurrentTraitCollection:(uint64_t)a3 usingBlock:
{
  void *v5;
  char *v6;
  uint64_t result;

  v5 = (void *)objc_opt_self();
  objc_opt_self();
  v6 = +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 0, 0);
  if (a2)
    objc_msgSend(v5, "_setCurrentTraitCollection:", a2);
  result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  if (a2)
    return objc_msgSend(v5, "_setCurrentTraitCollection:", v6);
  return result;
}

+ (NSArray)systemTraitsAffectingColorAppearance
{
  return (NSArray *)_UITraitsForTraitTokens((void *)objc_msgSend(a1, "_systemTraitTokensAffectingColorAppearance"));
}

+ (NSArray)systemTraitsAffectingImageLookup
{
  return (NSArray *)_UITraitsForTraitTokens((void *)objc_msgSend(a1, "_systemTraitTokensAffectingImageLookup"));
}

+ (NSArray)_systemTraitTokensAffectingImageLookup
{
  if (qword_1ECD7E490 != -1)
    dispatch_once(&qword_1ECD7E490, &__block_literal_global_288);
  return (NSArray *)qword_1ECD7E488;
}

+ (void)_systemTraitTokensAffectingImageLookupSet
{
  objc_opt_self();
  if (_systemTraitTokensAffectingImageLookupSet_onceToken != -1)
    dispatch_once(&_systemTraitTokensAffectingImageLookupSet_onceToken, &__block_literal_global_57_0);
}

- (id)_namedImageDescription
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v9 = 0;
  v10 = 0.0;
  v7 = 0;
  v8 = 0;
  v5 = 0;
  v6 = -1;
  +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, self, &v10, &v9, 0, 0, &v7, &v8, &v6, &v5);
  v3 = objc_alloc_init(MEMORY[0x1E0D1A6C0]);
  objc_msgSend(v3, "setScale:", v10);
  objc_msgSend(v3, "setDisplayGamut:", v8);
  objc_msgSend(v3, "setIdiom:", v9);
  objc_msgSend(v3, "setSubtype:", v7);
  objc_msgSend(v3, "setSizeClassHorizontal:", -[UITraitCollection horizontalSizeClass](self, "horizontalSizeClass"));
  objc_msgSend(v3, "setSizeClassVertical:", -[UITraitCollection verticalSizeClass](self, "verticalSizeClass"));
  objc_msgSend(v3, "setLayoutDirection:", v5);
  objc_msgSend(v3, "setAppearanceName:", -[UITraitCollection _appearanceName]((__CFString *)self));
  return v3;
}

- (__CFString)_appearanceName
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (result)
  {
    v1 = result;
    v2 = -[__CFString userInterfaceStyle](result, "userInterfaceStyle");
    v3 = -[__CFString accessibilityContrast](v1, "accessibilityContrast");
    v4 = CFSTR("UIAppearanceLight");
    if (v3 == 1)
    {
      v4 = CFSTR("UIAppearanceHighContrastLight");
      v5 = CFSTR("UIAppearanceHighContrastDark");
    }
    else
    {
      v5 = CFSTR("UIAppearanceDark");
    }
    v6 = CFSTR("UIAppearanceAny");
    if (v3 == 1)
      v6 = CFSTR("UIAppearanceHighContrastAny");
    if (v2 != 2)
      v5 = v6;
    if (v2 == 1)
      return (__CFString *)v4;
    else
      return (__CFString *)v5;
  }
  return result;
}

+ (UITraitCollection)traitCollectionWithUserInterfaceIdiom:(UIUserInterfaceIdiom)idiom
{
  UITraitCollection *result;
  char *v4;
  void *v5;
  uint64_t *v6;
  _QWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  switch(idiom)
  {
    case -1:
      result = (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
      break;
    case 0:
      if (qword_1ECD7E4A0 != -1)
        dispatch_once(&qword_1ECD7E4A0, &__block_literal_global_146_0);
      result = (UITraitCollection *)qword_1ECD7E498;
      break;
    case 1:
      if (qword_1ECD7E4B0 != -1)
        dispatch_once(&qword_1ECD7E4B0, &__block_literal_global_149_2);
      result = (UITraitCollection *)qword_1ECD7E4A8;
      break;
    case 2:
      if (qword_1ECD7E4C0 != -1)
        dispatch_once(&qword_1ECD7E4C0, &__block_literal_global_152_1);
      result = (UITraitCollection *)qword_1ECD7E4B8;
      break;
    case 3:
      if (qword_1ECD7E4D0 != -1)
        dispatch_once(&qword_1ECD7E4D0, &__block_literal_global_155_0);
      result = (UITraitCollection *)qword_1ECD7E4C8;
      break;
    case 4:
      if (qword_1ECD7E4E0 != -1)
        dispatch_once(&qword_1ECD7E4E0, &__block_literal_global_158_2);
      result = (UITraitCollection *)qword_1ECD7E4D8;
      break;
    case 5:
      if (qword_1ECD7E4F0 != -1)
        dispatch_once(&qword_1ECD7E4F0, &__block_literal_global_161);
      result = (UITraitCollection *)qword_1ECD7E4E8;
      break;
    case 6:
      if (qword_1ECD7E500 != -1)
        dispatch_once(&qword_1ECD7E500, &__block_literal_global_164_0);
      result = (UITraitCollection *)qword_1ECD7E4F8;
      break;
    case 7:
      if (qword_1ECD7E510 != -1)
        dispatch_once(&qword_1ECD7E510, &__block_literal_global_167);
      result = (UITraitCollection *)qword_1ECD7E508;
      break;
    case 8:
      if (qword_1ECD7E520 != -1)
        dispatch_once(&qword_1ECD7E520, &__block_literal_global_170);
      result = (UITraitCollection *)qword_1ECD7E518;
      break;
    case 9:
      if (qword_1ECD7E530 != -1)
        dispatch_once(&qword_1ECD7E530, &__block_literal_global_173);
      result = (UITraitCollection *)qword_1ECD7E528;
      break;
    case 10:
      if (qword_1ECD7E540 != -1)
        dispatch_once(&qword_1ECD7E540, &__block_literal_global_176);
      result = (UITraitCollection *)qword_1ECD7E538;
      break;
    default:
      v17 = xmmword_1866823F8;
      v18 = unk_186682408;
      v19 = xmmword_186682418;
      v20 = -1;
      v13 = xmmword_1866823B8;
      v14 = unk_1866823C8;
      v15 = xmmword_1866823D8;
      v16 = unk_1866823E8;
      v9 = xmmword_186682378;
      v10 = unk_186682388;
      v11 = xmmword_186682398;
      v12 = unk_1866823A8;
      v7[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
      v8 = unk_186682368;
      v7[0] = idiom;
      v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      v6 = (uint64_t *)(v4 + 248);
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v4 + 35) = 0;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 0, (__n128)0);
      v4[288] |= 1u;
      result = v4;
      break;
  }
  return result;
}

- (UITraitCollection)initWithCoder:(NSCoder *)coder
{
  char *v4;
  UITraitCollection *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSDictionary *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  NSCoder *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  id v22;
  UITraitCollection *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  objc_super v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)UITraitCollection;
  v4 = -[UITraitCollection init](&v33, sel_init);
  v5 = (UITraitCollection *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 168) = xmmword_1866823F8;
    *(_OWORD *)(v4 + 184) = unk_186682408;
    *(_OWORD *)(v4 + 200) = xmmword_186682418;
    *(_OWORD *)(v4 + 104) = xmmword_1866823B8;
    *(_OWORD *)(v4 + 120) = unk_1866823C8;
    *(_OWORD *)(v4 + 136) = xmmword_1866823D8;
    *(_OWORD *)(v4 + 152) = unk_1866823E8;
    *(_OWORD *)(v4 + 40) = xmmword_186682378;
    *(_OWORD *)(v4 + 56) = unk_186682388;
    *(_OWORD *)(v4 + 72) = xmmword_186682398;
    *(_OWORD *)(v4 + 88) = unk_1866823A8;
    *(_OWORD *)(v4 + 8) = _UIBuiltinTraitStorageUnspecified;
    *((_QWORD *)v4 + 27) = -1;
    v6 = MEMORY[0x1E0C809B0];
    *(_OWORD *)(v4 + 24) = unk_186682368;
    v31[4] = coder;
    v32[0] = v6;
    v32[1] = 3221225472;
    v32[2] = __35__UITraitCollection_initWithCoder___block_invoke;
    v32[3] = &unk_1E16CBF10;
    v32[4] = coder;
    v30[4] = coder;
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __35__UITraitCollection_initWithCoder___block_invoke_2;
    v31[3] = &unk_1E16CBF38;
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __35__UITraitCollection_initWithCoder___block_invoke_3;
    v30[3] = &unk_1E16CBF60;
    v36[1] = 3221225472;
    v36[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
    v36[3] = &unk_1E16CC710;
    v36[4] = v32;
    v35[0] = v6;
    v35[1] = 3221225472;
    v35[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
    v35[3] = &unk_1E16CC738;
    v35[4] = v31;
    v36[0] = v6;
    v34[0] = v6;
    v34[1] = 3221225472;
    v34[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
    v34[3] = &unk_1E16CC760;
    v34[4] = v30;
    _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)(v4 + 8), (uint64_t)(v4 + 8), 1, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34);
    v5->_tintColor = (UIColor *)-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITraitCollectionTintColor"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), CFSTR("UITraitEncodedKeys"));
    if (v11)
    {
      v12 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
        if (qword_1ECD7E798 != -1)
          dispatch_once(&qword_1ECD7E798, &__block_literal_global_646);
        v25 = qword_1ECD7E790;
        v14 = -[NSCoder requiresSecureCoding](coder, "requiresSecureCoding");
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = coder;
          v24 = v5;
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v12);
              v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v14)
                  v21 = -[NSCoder decodeObjectOfClasses:forKey:](v17, "decodeObjectOfClasses:forKey:", v25, v20);
                else
                  v21 = -[NSCoder decodeObjectForKey:](v17, "decodeObjectForKey:", v20);
                if (v21)
                  -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v21, objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("UITrait-"), &stru_1E16EDF20, 8, 0, objc_msgSend(v20, "length")));
              }
            }
            v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
          }
          while (v16);
          v5 = v24;
        }
        goto LABEL_25;
      }
    }
    if (qword_1ECD7E798 != -1)
      dispatch_once(&qword_1ECD7E798, &__block_literal_global_646);
    v22 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", qword_1ECD7E790, CFSTR("UITraitCollectionClientDefinedTraits"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v22, "count"))
    {
      v13 = (NSDictionary *)objc_msgSend(v22, "copy");
LABEL_25:
      v5->_clientDefinedTraits = v13;
    }
  }
  return v5;
}

+ (void)_setBackgroundThreadFallbackTraitCollection:(uint64_t)a1
{
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);

  _backgroundThreadFallbackTraitCollection = a2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
}

- (UITraitCollection)init
{

  return (UITraitCollection *)(id)+[UITraitCollection _emptyTraitCollection]();
}

+ (UITraitCollection)traitCollectionWithUserInterfaceLevel:(UIUserInterfaceLevel)userInterfaceLevel
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[9];
  uint64_t v8;
  UIUserInterfaceLevel v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  if (userInterfaceLevel == UIUserInterfaceLevelUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (userInterfaceLevel == UIUserInterfaceLevelElevated)
  {
    if (qword_1ECD7E6A0 != -1)
      dispatch_once(&qword_1ECD7E6A0, &__block_literal_global_222_0);
    return (UITraitCollection *)qword_1ECD7E698;
  }
  else if (userInterfaceLevel)
  {
    v10 = xmmword_1866823F8;
    v11 = unk_186682408;
    v12 = xmmword_186682418;
    v13 = -1;
    v7[6] = xmmword_1866823B8;
    v7[7] = unk_1866823C8;
    v7[8] = xmmword_1866823D8;
    v8 = unk_1866823E8;
    memset(&v7[2], 0, 48);
    v7[5] = unk_1866823A8;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186682368;
    v9 = userInterfaceLevel;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xAuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1ECD7E690 != -1)
      dispatch_once(&qword_1ECD7E690, &__block_literal_global_219_0);
    return (UITraitCollection *)qword_1ECD7E688;
  }
}

+ (const)_traitTokenOrPlaceholderForTrait:(uint64_t)a1
{
  const __CFNumber *v3;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v3 = _UITraitTokenForTraitLocked(0, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (UITraitCollection)traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[3];
  uint64_t v8;
  UIUserInterfaceSizeClass v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  switch(horizontalSizeClass)
  {
    case UIUserInterfaceSizeClassUnspecified:
      return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
    case UIUserInterfaceSizeClassRegular:
      if (qword_1ECD7E5B0 != -1)
        dispatch_once(&qword_1ECD7E5B0, &__block_literal_global_191);
      return (UITraitCollection *)qword_1ECD7E5A8;
    case UIUserInterfaceSizeClassCompact:
      if (qword_1ECD7E5A0 != -1)
        dispatch_once(&qword_1ECD7E5A0, &__block_literal_global_188);
      return (UITraitCollection *)qword_1ECD7E598;
    default:
      v16 = xmmword_1866823F8;
      v17 = unk_186682408;
      v18 = xmmword_186682418;
      v19 = -1;
      v12 = xmmword_1866823B8;
      v13 = unk_1866823C8;
      v14 = xmmword_1866823D8;
      v15 = unk_1866823E8;
      v7[2] = xmmword_186682378;
      v8 = unk_186682388;
      v10 = xmmword_186682398;
      v11 = unk_1866823A8;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186682368;
      v9 = horizontalSizeClass;
      v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      v6 = (uint64_t *)(v4 + 248);
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v4 + 35) = 0;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 4uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
  }
}

char *__42__UITraitCollection__emptyTraitCollection__block_invoke()
{
  char *result;

  result = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, 0);
  qword_1ECD7E770 = (uint64_t)result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_self() == a1)
    _UIInitializeBuiltInTraits();
}

- (NSString)description
{
  int has_internal_diagnostics;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  return (NSString *)-[UITraitCollection _descriptionWithPrivateTraits:]((uint64_t)self, has_internal_diagnostics);
}

+ (id)_defineCGFloatTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(double)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9
{
  _QWORD v10[6];
  BOOL v11;
  BOOL v12;
  BOOL v13;
  int v14;
  char v15;

  v15 = 0;
  v14 = 0;
  v10[0] = a9;
  v10[1] = 2;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = 0;
  *(double *)&v10[5] = a5;
  v11 = a7;
  v12 = a6;
  v13 = a8;
  return _UIDefineNewTrait((uint64_t)v10);
}

+ (id)_defineNSIntegerTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(int64_t)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9
{
  _QWORD v10[6];
  BOOL v11;
  BOOL v12;
  BOOL v13;
  int v14;
  char v15;

  v15 = 0;
  v14 = 0;
  v10[0] = a9;
  v10[1] = 3;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = 0;
  v10[5] = a5;
  v11 = a7;
  v12 = a6;
  v13 = a8;
  return _UIDefineNewTrait((uint64_t)v10);
}

+ (id)_defineObjectTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(id)a5 equalityHandler:(id)a6 affectsColorAppearance:(BOOL)a7 defaultValueRepresentsUnspecified:(BOOL)a8 isPrivate:(BOOL)a9 placeholderToken:(id)a10
{
  _QWORD v11[6];
  BOOL v12;
  BOOL v13;
  BOOL v14;
  int v15;
  char v16;

  v16 = 0;
  v15 = 0;
  v11[0] = a10;
  v11[1] = 1;
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a6;
  v11[5] = a5;
  v12 = a8;
  v13 = a7;
  v14 = a9;
  return _UIDefineNewTrait((uint64_t)v11);
}

- (BOOL)_containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1
{
  _BOOL8 v3;
  uint64_t *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (!a1)
    return 0;
  v3 = 1;
  if (a2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke;
    v10[3] = &unk_1E16CC3B0;
    v10[4] = a1;
    v10[5] = a2;
    v10[6] = &v11;
    _UIPerformWithTraitLock((uint64_t)v10);
    v5 = v12;
    if (*((_BYTE *)v12 + 24))
    {
      v6 = *(void **)(a2 + 232);
      if (v6)
      {
        v7 = *(void **)(a1 + 232);
        if (v7 != v6)
        {
          if (v7 && (v8 = objc_msgSend(v7, "isEqual:"), v5 = v12, v8))
          {
            v3 = *((unsigned __int8 *)v12 + 24) != 0;
          }
          else
          {
            v3 = 0;
            *((_BYTE *)v5 + 24) = 0;
          }
        }
      }
    }
    else
    {
      v3 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  return v3;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceStyle___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[4];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v11 = xmmword_1866823F8;
  v12 = unk_186682408;
  v13 = xmmword_186682418;
  v14 = -1;
  v7 = xmmword_1866823B8;
  v8 = unk_1866823C8;
  v9 = xmmword_1866823D8;
  v10 = unk_1866823E8;
  memset(&v3[2], 0, 32);
  v4 = 0;
  v6 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 2;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5E8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5E8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 1uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5E8 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke_3()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v4 = unk_186682368;
  v3[1] = 0x4008000000000000;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E568 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E568;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E568 + 288) |= 1u;
}

+ (id)_traitCollectionWithValue:(id)a3 forTraitNamed:(id)a4
{
  id v4;
  id v6;
  void *v7;
  _QWORD v9[6];
  _OWORD v10[13];
  uint64_t v11;
  id v12;
  _QWORD v13[2];

  v4 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v10[10] = xmmword_1866823F8;
  memset(&v10[11], 255, 32);
  v11 = -1;
  v10[6] = xmmword_1866823B8;
  v10[7] = unk_1866823C8;
  v10[8] = xmmword_1866823D8;
  v10[9] = unk_1866823E8;
  memset(&v10[2], 0, 48);
  v10[5] = unk_1866823A8;
  v10[0] = _UIBuiltinTraitStorageUnspecified;
  v10[1] = unk_186682368;
  if (CFSTR("_UITraitNameTintColor") == a4)
  {
    v7 = 0;
    v6 = a3;
LABEL_9:
    v4 = 0;
    return -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v10, v6, v7, v4);
  }
  if (CFSTR("_UITraitNameEnvironmentWrapper") == a4)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__UITraitCollection__traitCollectionWithValue_forTraitNamed___block_invoke;
  v9[3] = &unk_1E16CC668;
  v9[4] = a3;
  v9[5] = a2;
  if ((_UIBuiltinTraitStoragePerformActionWithValueForTraitNamed((uint64_t)v10, (__CFString *)a4, (uint64_t)v9) & 1) == 0)
  {
    v12 = a4;
    v13[0] = v4;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  v4 = 0;
LABEL_7:
  v7 = 0;
  return -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v10, v6, v7, v4);
}

- (id)_valueForTraitNamed:(id)a3
{
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  if (CFSTR("_UITraitNameTintColor") == a3)
    return self->_tintColor;
  if (CFSTR("_UITraitNameEnvironmentWrapper") == a3)
    return self->_environmentWrapper;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__115;
  v12 = __Block_byref_object_dispose__115;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__UITraitCollection__valueForTraitNamed___block_invoke;
  v7[3] = &unk_1E16CC400;
  v7[4] = &v8;
  if (_UIBuiltinTraitStoragePerformActionWithValueForTraitNamed((uint64_t)&self->_builtinTraits, (__CFString *)a3, (uint64_t)v7))v5 = (id)v9[5];
  else
    v5 = -[NSDictionary objectForKeyedSubscript:](self->_clientDefinedTraits, "objectForKeyedSubscript:", a3);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v4 = unk_186682368;
  v3[1] = 0x3FF0000000000000;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E548 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E548;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E548 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_4()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 4;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6D8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6D8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6D8 + 288) |= 1u;
}

void __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFNumber *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v6 = (const __CFNumber *)objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (v6)
  {
    v10 = 0;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    _UIGetTraitMetadataLocked(v6, 0, (uint64_t)&v7);
    if (*(_BYTE *)(a1 + 40) || (v10 & 4) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), (_QWORD)v8, a3));
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), a2, a3));
  }
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  void *v7;

  result = objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!result)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v7)
    {
      result = objc_msgSend(v7, "objectForKeyedSubscript:", a2);
      if (!result)
        return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
    }
    else
    {
      result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a3, a2, 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    }
  }
  return result;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceStyle___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[4];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v11 = xmmword_1866823F8;
  v12 = unk_186682408;
  v13 = xmmword_186682418;
  v14 = -1;
  v7 = xmmword_1866823B8;
  v8 = unk_1866823C8;
  v9 = xmmword_1866823D8;
  v10 = unk_1866823E8;
  memset(&v3[2], 0, 32);
  v4 = 0;
  v6 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5D8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5D8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 1uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5D8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 0;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E498 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E498;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E498 + 288) |= 1u;
}

void __60__UITraitCollection_traitCollectionWithHorizontalSizeClass___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[3];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v12 = xmmword_1866823F8;
  v13 = unk_186682408;
  v14 = xmmword_186682418;
  v15 = -1;
  v8 = xmmword_1866823B8;
  v9 = unk_1866823C8;
  v10 = xmmword_1866823D8;
  v11 = unk_1866823E8;
  v3[2] = xmmword_186682378;
  v4 = unk_186682388;
  v6 = xmmword_186682398;
  v7 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E598 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E598;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 4uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E598 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v4 = unk_186682368;
  v3[1] = 0x4000000000000000;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E558 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E558;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E558 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceLevel___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[9];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v6 = xmmword_1866823F8;
  v7 = unk_186682408;
  v8 = xmmword_186682418;
  v9 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v4 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E698 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E698;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xAuLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E698 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceLevel___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[13];
  uint64_t v4;

  v3[10] = xmmword_1866823F8;
  memset(&v3[11], 255, 32);
  v4 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v3[9] = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E688 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E688;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xAuLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E688 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_3()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 3;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6C8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6C8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6C8 + 288) |= 1u;
}

void __60__UITraitCollection_traitCollectionWithHorizontalSizeClass___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[3];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v12 = xmmword_1866823F8;
  v13 = unk_186682408;
  v14 = xmmword_186682418;
  v15 = -1;
  v8 = xmmword_1866823B8;
  v9 = unk_1866823C8;
  v10 = xmmword_1866823D8;
  v11 = unk_1866823E8;
  v3[2] = xmmword_186682378;
  v4 = unk_186682388;
  v6 = xmmword_186682398;
  v7 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 2;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5A8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5A8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 4uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5A8 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_9()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 65537;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E728 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E728;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E728 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_8()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 0x10000;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E718 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E718;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E718 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_7()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 7;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E708 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E708;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E708 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_10()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 65538;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E738 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E738;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E738 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_3()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 2;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4B8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4B8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4B8 + 288) |= 1u;
}

- (double)_headroomSuppressionLimit
{
  void *v3;
  double v4;
  double v5;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITraitCollection valueForCGFloatTrait:](self, "valueForCGFloatTrait:", v3);
  v5 = v4;

  return v5;
}

+ (id)_traitCollectionWithHeadroomSuppressionLimit:(double)a3
{
  void *v4;
  void *v5;

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection traitCollectionWithCGFloatValue:forTrait:](UITraitCollection, "traitCollectionWithCGFloatValue:forTrait:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (const)_traitTokenForCGFloatTrait:(uint64_t)a1
{
  const __CFNumber *v3;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v3 = _UITraitTokenForTraitLocked(2, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (const)_traitTokenForNSUIntegerTrait:(uint64_t)a1
{
  const __CFNumber *v3;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v3 = _UITraitTokenForTraitLocked(4, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (const)_traitTokenForObjectTrait:(uint64_t)a1
{
  const __CFNumber *v3;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v3 = _UITraitTokenForTraitLocked(1, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (id)_nameForTrait:(Class)a3
{
  const __CFNumber *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v4 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  objc_opt_self();
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v6);
  return (id)v7;
}

+ (uint64_t)_nameForTraitToken:(uint64_t)a1
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  objc_opt_self();
  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  _UIGetTraitMetadata(a2, 0, (uint64_t)&v4);
  return v5;
}

+ (id)_identifierForTrait:(Class)a3
{
  const __CFNumber *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v4 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  objc_opt_self();
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v6);
  return (id)*((_QWORD *)&v7 + 1);
}

+ (UITraitCollection)traitCollectionWithCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)objc_msgSend(a1, "_traitCollectionWithCGFloatValue:forTraitToken:", v7, value);
}

+ (id)_traitCollectionWithCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, *(uint64_t *)&a3, (uint64_t)v6);
}

+ (id)_traitCollectionWithValue:(uint64_t)a3 forTraitWithMetadata:
{
  void *v5;
  __int128 v6;
  __int128 v8[3];
  uint64_t v9;

  objc_opt_self();
  v5 = (void *)+[UITraitCollection _emptyTraitCollection]();
  v6 = *(_OWORD *)(a3 + 16);
  v8[0] = *(_OWORD *)a3;
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a3 + 32);
  v9 = *(_QWORD *)(a3 + 48);
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](v5, a2, v8);
}

- (UITraitCollection)traitCollectionByReplacingCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)-[UITraitCollection _traitCollectionByReplacingCGFloatValue:forTraitToken:](self, "_traitCollectionByReplacingCGFloatValue:forTraitToken:", v7, value);
}

- (void)setCGFloatValue:(double)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    v7 = _UITraitTokenForTraitLocked(2, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    -[UITraitCollection _setCGFloatValue:forTraitToken:](self, "_setCGFloatValue:forTraitToken:", v7, a3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 484, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v9 = setCGFloatValue_forTrait____s_category;
    if (!setCGFloatValue_forTrait____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&setCGFloatValue_forTrait____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

+ (UITraitCollection)traitCollectionWithNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)objc_msgSend(a1, "_traitCollectionWithNSIntegerValue:forTraitToken:", value, v7);
}

+ (id)_traitCollectionWithNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, a3, (uint64_t)v6);
}

+ (UITraitCollection)traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(4, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)objc_msgSend(a1, "_traitCollectionWithNSUIntegerValue:forTraitToken:", a3, v7);
}

+ (id)_traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, a3, (uint64_t)v6);
}

- (id)traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(4, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _traitCollectionByReplacingNSUIntegerValue:forTraitToken:](self, "_traitCollectionByReplacingNSUIntegerValue:forTraitToken:", a3, v7);
}

- (id)_traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  __int128 v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, a3, v7);
}

- (unint64_t)valueForNSUIntegerTrait:(Class)a3
{
  const __CFNumber *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(4, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _valueForNSUIntegerTraitToken:](self, "_valueForNSUIntegerTraitToken:", v5);
}

- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3
{
  _OWORD v5[3];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 4uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v6 = v10;
  return (unint64_t)-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

- (void)setNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    v7 = _UITraitTokenForTraitLocked(4, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    -[UITraitCollection _setNSUIntegerValue:forTraitToken:](self, "_setNSUIntegerValue:forTraitToken:", a3, v7);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 582, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v9 = setNSUIntegerValue_forTrait____s_category;
    if (!setNSUIntegerValue_forTrait____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&setNSUIntegerValue_forTrait____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

+ (UITraitCollection)traitCollectionWithObject:(id)object forTrait:(UIObjectTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)objc_msgSend(a1, "_traitCollectionWithObject:forTraitToken:", object, v7);
}

+ (id)_traitCollectionWithObject:(id)a3 forTraitToken:(id)a4
{
  _OWORD v6[3];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, (uint64_t)a3, (uint64_t)v6);
}

- (UITraitCollection)traitCollectionByReplacingObject:(id)object forTrait:(UIObjectTrait)trait
{
  const __CFNumber *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v7 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)-[UITraitCollection _traitCollectionByReplacingObject:forTraitToken:](self, "_traitCollectionByReplacingObject:forTraitToken:", object, v7);
}

- (id)_traitCollectionByReplacingObject:(id)a3 forTraitToken:(id)a4
{
  __int128 v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, (uint64_t)a3, v7);
}

- (void)setObject:(id)a3 forTrait:(Class)a4
{
  const __CFNumber *v7;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    v7 = _UITraitTokenForTraitLocked(1, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    -[UITraitCollection _setObject:forTraitToken:](self, "_setObject:forTraitToken:", a3, v7);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 640, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v9 = setObject_forTrait____s_category;
    if (!setObject_forTrait____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&setObject_forTrait____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (id)_traitCollectionByRemovingTrait:(Class)a3
{
  const __CFNumber *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _traitCollectionByRemovingTraitToken:](self, "_traitCollectionByRemovingTraitToken:", v5);
}

- (id)traitCollectionByFilteringTraits:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFNumber *v10;
  unint64_t v11;
  __n128 v12;
  char *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
        v10 = _UITraitTokenForTraitLocked(0, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
        v11 = _UIGetTraitTokenValue(v10);
        _UITraitTokenSetInsert((uint64_t *)v19, v11, v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }
  v13 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:]((char *)self, (uint64_t *)v19);
  if (*(_QWORD *)&v19[0])

  return v13;
}

- (id)_traitCollectionByFilteringTraitTokens:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __n128 v10;
  char *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = _UIGetTraitTokenValue(*(const __CFNumber **)(*((_QWORD *)&v13 + 1) + 8 * v8));
        _UITraitTokenSetInsert((uint64_t *)v17, v9, v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }
  v11 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:]((char *)self, (uint64_t *)v17);
  if (*(_QWORD *)&v17[0])

  return v11;
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_3(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  int8x16_t v12;
  uint64_t v13;
  uint8_t buf[16];
  __int128 v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2))
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v10);
    if (*((_QWORD *)&v10 + 1))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_OWORD *)buf = v10;
      v15 = v11;
      v16 = v12;
      v17 = v13;
      v5 = (__CFString *)-[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)buf);
      v6 = *(_QWORD *)(a1 + 40);
      *(_OWORD *)buf = v10;
      v15 = v11;
      v16 = v12;
      v17 = v13;
      -[UITraitCollection _setValue:forTraitWithMetadata:](v6, v5, (uint64_t)buf, v12);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Filtering placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
    else
    {
      v7 = _block_invoke___s_category_2;
      if (!_block_invoke___s_category_2)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_block_invoke___s_category_2);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Filtering placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
  }
}

- (NSSet)_specifiedTraits
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", _UITraitsForTraitTokens(-[UITraitCollection _specifiedTraitTokensArray](self, "_specifiedTraitTokensArray")));
}

- (uint64_t)_specifiedTraitTokensLocked
{
  uint64_t v1;
  __int128 v2;
  _OWORD v3[2];
  uint64_t v4;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 288) & 1) == 0)
    {
      -[UITraitCollection _computeSpecifiedTraitTokensAcquireLock:]((_QWORD *)result, 0, (uint64_t)v3);
      v2 = v3[1];
      *(_OWORD *)(v1 + 248) = v3[0];
      *(_OWORD *)(v1 + 264) = v2;
      *(_QWORD *)(v1 + 280) = v4;
      *(_BYTE *)(v1 + 288) |= 1u;
    }
    return v1 + 248;
  }
  return result;
}

- (NSArray)_specifiedTraitTokensArray
{
  void *v3;
  uint64_t v4;
  void (*v5)(_QWORD, _QWORD, _QWORD);
  uint64_t *v6;
  void (*v8[5])(_QWORD, _QWORD, _QWORD);

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = -[UITraitCollection _specifiedTraitTokens]((uint64_t)self);
  v5 = (void (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(v3, "arrayWithCapacity:", _UITraitTokenSetCount(v4));
  v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens]((uint64_t)self);
  v8[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD, _QWORD))__47__UITraitCollection__specifiedTraitTokensArray__block_invoke;
  v8[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC810;
  v8[4] = v5;
  _UITraitTokenSetEnumerate(v6, v8);
  return (NSArray *)v5;
}

uint64_t __47__UITraitCollection__specifiedTraitTokensArray__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

- (BOOL)_isTraitSpecified:(Class)a3
{
  const __CFNumber *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  v5 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return -[UITraitCollection _isTraitTokenSpecified:](self, "_isTraitTokenSpecified:", v5);
}

- (NSSet)changedTraitsFromTraitCollection:(UITraitCollection *)traitCollection
{
  void *v3;
  int8x16_t *v4;
  void (*v5)(_QWORD, _QWORD, _QWORD);
  void (*v7[5])(_QWORD, _QWORD, _QWORD);
  int8x16_t v8[3];

  memset(v8, 0, 40);
  -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)self, (uint64_t)traitCollection, (uint64_t)v8);
  v3 = (void *)MEMORY[0x1E0C99DE8];
  if (v8[0].i64[0])
    v4 = -[_UIFastIndexSet count]((int8x16_t *)v8[0].i64[0]);
  else
    v4 = (int8x16_t *)vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v8 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)&v8[1] + 8))))));
  v5 = (void (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(v3, "arrayWithCapacity:", v4);
  v7[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v7[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD, _QWORD))__54__UITraitCollection_changedTraitsFromTraitCollection___block_invoke;
  v7[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC810;
  v7[4] = v5;
  _UITraitTokenSetEnumerate(v8[0].i64, v7);
  if (v8[0].i64[0])

  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", _UITraitsForTraitTokens(v5));
}

- (uint64_t)_createTraitTokenSetForChangesFromTraitCollection:(uint64_t)a3@<X8>
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  _BYTE *TraitCollectionTSD;
  char v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[9];

  if (!result || (v5 = result, result == a2))
  {
    *(_QWORD *)(a3 + 32) = 0;
    v11 = 0uLL;
    *(_OWORD *)(a3 + 16) = 0u;
LABEL_10:
    *(_OWORD *)a3 = v11;
    return result;
  }
  result = -[UITraitCollection _specifiedTraitTokens](result);
  v6 = result;
  if (!a2)
  {
    if (*(_QWORD *)result)
      result = (uint64_t)*(id *)result;
    v11 = *(_OWORD *)v6;
    v12 = *(_OWORD *)(v6 + 16);
    *(_QWORD *)(a3 + 32) = *(_QWORD *)(v6 + 32);
    *(_OWORD *)(a3 + 16) = v12;
    goto LABEL_10;
  }
  v7 = -[UITraitCollection _specifiedTraitTokens](a2);
  v8 = _UITraitTokenSetCount(v6);
  result = (uint64_t)_UITraitTokenSetCount(v7);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)(a3 + 32) = 0;
  if ((unint64_t)v8 | result)
  {
    TraitCollectionTSD = GetTraitCollectionTSD();
    v10 = TraitCollectionTSD[9];
    TraitCollectionTSD[9] = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke;
    v13[3] = &unk_1E16CC098;
    v13[6] = v6;
    v13[7] = v7;
    v13[8] = a3;
    v13[4] = v5;
    v13[5] = a2;
    _UIPerformWithTraitLock((uint64_t)v13);
    result = (uint64_t)GetTraitCollectionTSD();
    *(_BYTE *)(result + 9) = v10;
  }
  return result;
}

uint64_t __54__UITraitCollection_changedTraitsFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void (*v3)(_QWORD, _QWORD, _QWORD);
  __int128 v4;
  uint64_t *v5;
  void (*v6)(_QWORD, _QWORD, _QWORD);
  void (*v7[6])(_QWORD, _QWORD, _QWORD);
  void (*v8[4])(_QWORD, _QWORD, _QWORD);
  __int128 v9;
  __int128 v10;

  v2 = *(uint64_t **)(a1 + 48);
  v3 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD, _QWORD))__71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC050;
  v4 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 32);
  v10 = v4;
  _UITraitTokenSetEnumerate(v2, v8);
  v7[0] = v3;
  v7[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD, _QWORD))__71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_3;
  v7[3] = (void (*)(_QWORD, _QWORD, _QWORD))&__block_descriptor_48_e12_v24__0Q8_B16l;
  v5 = *(uint64_t **)(a1 + 56);
  v6 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 64);
  v7[4] = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 48);
  v7[5] = v6;
  _UITraitTokenSetEnumerate(v5, v7);
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_2(uint64_t a1, unint64_t a2)
{
  __n128 v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  if ((_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2) & 1) == 0)
    goto LABEL_10;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v13);
  v5 = *((_QWORD *)&v13 + 1);
  v6 = *(_QWORD *)(a1 + 32);
  if (*((_QWORD *)&v13 + 1))
  {
    v9 = v13;
    v10 = v14;
    v11 = v15;
    v12 = v16;
    v7 = -[UITraitCollection _valueForTraitWithMetadata:](v6, (uint64_t)&v9);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = v13;
    v10 = v14;
    v11 = v15;
    v12 = v16;
    if (v7 != -[UITraitCollection _valueForTraitWithMetadata:](v8, (uint64_t)&v9)
      && (v5 != 1 || !(_QWORD)v15 || ((*(uint64_t (**)(void))(v15 + 16))() & 1) == 0))
    {
      goto LABEL_10;
    }
  }
  else if ((objc_msgSend((id)objc_msgSend(*(id *)(v6 + 224), "objectForKey:", *((_QWORD *)&v14 + 1)), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "objectForKey:", *((_QWORD *)&v14 + 1))) & 1) == 0)
  {
LABEL_10:
    _UITraitTokenSetInsert(*(uint64_t **)(a1 + 56), a2, v4);
  }
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_3(uint64_t a1, unint64_t a2)
{
  __n128 v4;

  if ((_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 32), a2) & 1) == 0)
    _UITraitTokenSetInsert(*(uint64_t **)(a1 + 40), a2, v4);
}

uint64_t __65__UITraitCollection__changedTraitTokensArrayFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

void __59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke()
{
  void (*v0)(_QWORD, _QWORD, _QWORD);
  void (*v1[5])(_QWORD, _QWORD, _QWORD);

  +[UITraitCollection _systemTraitTokensAffectingImageLookupSet]();
  v0 = (void (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", _UITraitTokenSetCount((uint64_t)qword_1ECD7E7D0));
  v1[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v1[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
  v1[2] = (void (*)(_QWORD, _QWORD, _QWORD))__59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke_2;
  v1[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC810;
  v1[4] = v0;
  _UITraitTokenSetEnumerate(qword_1ECD7E7D0, v1);
  qword_1ECD7E488 = (uint64_t)v0;
}

uint64_t __59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

- (int64_t)_compare:(id)a3
{
  NSUInteger v6;
  uint64_t v7;
  uint64_t *v8;
  NSUInteger v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 1436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherTraitCollection isKindOfClass:[UITraitCollection class]]"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[4] = &v16;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __30__UITraitCollection__compare___block_invoke;
  v15[3] = &unk_1E16CC138;
  v15[4] = &v16;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __30__UITraitCollection__compare___block_invoke_2;
  v14[3] = &unk_1E16CC160;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __30__UITraitCollection__compare___block_invoke_3;
  v13[3] = &unk_1E16CC188;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)a3 + 8, 1, (uint64_t)v15, (uint64_t)v14, (uint64_t)v13);
  v6 = -[NSDictionary count](self->_clientDefinedTraits, "count");
  v7 = objc_msgSend(*((id *)a3 + 28), "count");
  v8 = v17;
  v9 = v17[3] + v6 - v7;
  v17[3] = v9;
  if (self->_environmentWrapper)
    ++v9;
  v10 = v9 - (*((_QWORD *)a3 + 29) != 0);
  v8[3] = v10;
  if (v10 >= 1)
    v11 = 1;
  else
    v11 = v10 >> 63;
  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __30__UITraitCollection__compare___block_invoke(uint64_t result, _QWORD *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a3;
  if (*a2 == a5)
  {
    if (v5 == a5)
      return result;
    v6 = -1;
  }
  else
  {
    if (v5 != a5)
      return result;
    v6 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__UITraitCollection__compare___block_invoke_2(uint64_t result, _QWORD *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a3;
  if (*a2 == a5)
  {
    if (v5 == a5)
      return result;
    v6 = -1;
  }
  else
  {
    if (v5 != a5)
      return result;
    v6 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__UITraitCollection__compare___block_invoke_3(uint64_t result, double *a2, double *a3, double a4)
{
  uint64_t v4;

  if (*a2 != a4 && *a3 == a4)
  {
    v4 = 1;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v4;
    return result;
  }
  if (*a2 == a4 && *a3 != a4)
  {
    v4 = -1;
    goto LABEL_7;
  }
  return result;
}

uint64_t __69__UITraitCollection__traitsDescriptionMatching_includePrivateTraits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "lowercaseString"), "containsString:", *(_QWORD *)(a1 + 32));
}

- (id)_description
{
  return (id)-[UITraitCollection _descriptionWithPrivateTraits:]((uint64_t)self, 1);
}

+ (id)_descriptionForChangeFromTraitCollection:(id)a3 toTraitCollection:(id)a4
{
  int has_internal_diagnostics;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[7];
  char v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!a3)
  {
    a3 = (id)+[UITraitCollection _emptyTraitCollection]();
    if (a4)
      goto LABEL_3;
LABEL_13:
    a4 = (id)+[UITraitCollection _emptyTraitCollection]();
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_13;
LABEL_3:
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke;
  v22[3] = &unk_1E16CC228;
  v22[4] = v7;
  v20[4] = v7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_2;
  v21[3] = &unk_1E16CC250;
  v21[4] = v7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_3;
  v20[3] = &unk_1E16CC278;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)a3 + 8, (uint64_t)a4 + 8, has_internal_diagnostics, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20);
  if (has_internal_diagnostics)
  {
    v9 = (void *)*((_QWORD *)a3 + 30);
    v10 = (void *)*((_QWORD *)a4 + 30);
    if (v9 != v10)
    {
      if (v9 && v10)
      {
        if ((objc_msgSend(v9, "isEqual:") & 1) != 0)
          goto LABEL_17;
        v9 = (void *)*((_QWORD *)a3 + 30);
      }
      if (v9)
      {
        if (*((_QWORD *)a4 + 30))
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_tintColor: %@ → %@"), v9, *((_QWORD *)a4 + 30));
        else
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_tintColor: %@ → (unspecified)"), v9, v17);
      }
      else
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_tintColor: (unspecified) → %@"), *((_QWORD *)a4 + 30), v17);
      }
      objc_msgSend(v7, "addObject:", v11);
    }
  }
LABEL_17:
  v12 = *((_QWORD *)a3 + 28);
  v13 = *((_QWORD *)a4 + 28);
  if (v12 != v13)
  {
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_4;
    v18[3] = &unk_1E16CC2E8;
    v19 = has_internal_diagnostics;
    v18[4] = v12;
    v18[5] = v13;
    v18[6] = v7;
    _UIPerformWithTraitLock((uint64_t)v18);
  }
  if (has_internal_diagnostics)
  {
    v14 = (void *)*((_QWORD *)a3 + 29);
    v15 = (void *)*((_QWORD *)a4 + 29);
    if (v14 != v15)
    {
      if (v14 && v15)
      {
        if ((objc_msgSend(v14, "isEqual:") & 1) != 0)
          goto LABEL_26;
        v14 = (void *)*((_QWORD *)a3 + 29);
        v15 = (void *)*((_QWORD *)a4 + 29);
      }
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_environmentWrapper: %@ → %@"), v14, v15));
    }
  }
LABEL_26:
  if (objc_msgSend(v7, "count"))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ }"), objc_msgSend(v7, "componentsJoinedByString:", CFSTR("; ")));
  else
    return CFSTR("(no changes)");
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke(uint64_t result, unint64_t *a2, unint64_t *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (*a2 != *a3)
  {
    v7 = result;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@: "), _UIDescriptionForTraitName(a4));
    v9 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(*a2, a4);
    if (v9)
      objc_msgSend(v8, "appendFormat:", CFSTR("%@"), v9);
    else
      objc_msgSend(v8, "appendFormat:", CFSTR("%ld"), *a2);
    objc_msgSend(v8, "appendString:", CFSTR(" → "));
    v10 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(*a3, a4);
    if (v10)
      objc_msgSend(v8, "appendFormat:", CFSTR("%@"), v10);
    else
      objc_msgSend(v8, "appendFormat:", CFSTR("%ld"), *a3);
    return objc_msgSend(*(id *)(v7 + 32), "addObject:", v8);
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_2(uint64_t result, _QWORD *a2, _QWORD *a3, void *a4)
{
  if (*a2 != *a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %ld → %ld"), _UIDescriptionForTraitName(a4), *a2, *a3));
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_3(uint64_t result, _QWORD *a2, _QWORD *a3, void *a4)
{
  if (*(double *)a2 != *(double *)a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %g → %g"), _UIDescriptionForTraitName(a4), *a2, *a3));
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[8];
  _QWORD v8[4];
  __int128 v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[4];
  char v13;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_5;
  v12[3] = &__block_descriptor_33_e18_B16__0__NSString_8l;
  v13 = *(_BYTE *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_7;
  v8[3] = &unk_1E16CC2C0;
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v12;
  v11 = &__block_literal_global_109_1;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_8;
  v7[3] = &unk_1E16CC2C0;
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v5;
  v7[6] = v12;
  v7[7] = &__block_literal_global_109_1;
  return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  const __CFNumber *v3;
  _OWORD v4[3];
  uint64_t v5;

  if (*(_BYTE *)(a1 + 32))
    return 0;
  v3 = (const __CFNumber *)objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!v3)
    return 1;
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadataLocked(v3, 0, (uint64_t)v4);
  return (v5 >> 2) & 1;
}

const __CFString *__80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  const __CFNumber *v2;
  _OWORD v4[3];
  uint64_t v5;

  v2 = (const __CFNumber *)objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!v2)
    return CFSTR("(unspecified)");
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadataLocked(v2, 0, (uint64_t)v4);
  if ((v5 & 2) != 0)
    return CFSTR("(unspecified)");
  else
    return CFSTR("(defaultValue)");
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
    if (result)
    {
      v7 = result;
      if ((void *)result == a3)
        return result;
      if (a3)
      {
        result = objc_msgSend(a3, "isEqual:", result);
        if ((result & 1) != 0)
          return result;
      }
      v8 = *(void **)(a1 + 40);
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ → %@"), a2, a3, v7);
      v10 = v8;
    }
    else
    {
      v11 = *(void **)(a1 + 40);
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ → %@"), a2, a3, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))());
      v10 = v11;
    }
    return objc_msgSend(v10, "addObject:", v9);
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
    if (!result)
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ → %@"), a2, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))(), a3));
  }
  return result;
}

- (id)_descriptionForChangeFromTraitCollection:(id)a3
{
  return +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", a3, self);
}

- (id)_descriptionForChangeToTraitCollection:(id)a3
{
  return +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", self, a3);
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t result;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 64))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    while ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
    {
      result = objc_msgSend(v6, "superclass");
      v6 = (void *)result;
      if (!result)
      {
        if (*(_BYTE *)(a1 + 64))
          goto LABEL_8;
        goto LABEL_6;
      }
    }
    goto LABEL_7;
  }
LABEL_6:
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
LABEL_7:
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UITrait-%@"), a2);
    objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", a3, v9);
    return objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  }
LABEL_8:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    while ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
    {
      result = objc_msgSend(v6, "superclass");
      v6 = (void *)result;
      if (!result)
      {
        if (*(_BYTE *)(a1 + 48))
          return result;
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    result = objc_opt_respondsToSelector();
    if ((result & 1) == 0)
      return result;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a3, a2);
}

void __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  v6 = *((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1) && (v20 & 2) != 0)
  {
    if ((_QWORD)v17 == 15)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      v8 = -[UITraitCollection _valueForTraitWithMetadata:](v7, (uint64_t)&v13);
      v9 = *(_QWORD *)(a1 + 40);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      if (((unint64_t)v8 & ~(unint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v9, (uint64_t)&v13)) == 0)return;
LABEL_11:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a3 = 1;
      return;
    }
    if (!_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 56), a2))
      goto LABEL_11;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v11 = -[UITraitCollection _valueForTraitWithMetadata:](v10, (uint64_t)&v13);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v16 = v20;
    if (v11 != -[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13)
      && (v6 != 1 || !(_QWORD)v19 || ((*(uint64_t (**)(void))(v19 + 16))() & 1) == 0))
    {
      goto LABEL_11;
    }
  }
}

uint64_t __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", a2);
    if (!result || (result = objc_msgSend((id)result, "isEqual:", a3), (result & 1) == 0))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

void __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  v6 = *((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1) && (v20 & 2) != 0)
  {
    if ((_QWORD)v17 == 15)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      v8 = -[UITraitCollection _valueForTraitWithMetadata:](v7, (uint64_t)&v13);
      v9 = *(_QWORD *)(a1 + 40);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      if (((unint64_t)v8 & ~(unint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v9, (uint64_t)&v13)) != 0)
      {
LABEL_5:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
    }
    else if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 56), a2))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      v11 = -[UITraitCollection _valueForTraitWithMetadata:](v10, (uint64_t)&v13);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = v17;
      v14 = v18;
      v15 = v19;
      v16 = v20;
      if (v11 != -[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13)
        && (v6 != 1 || !(_QWORD)v19 || ((*(uint64_t (**)(void))(v19 + 16))() & 1) == 0))
      {
        goto LABEL_5;
      }
    }
  }
}

uint64_t __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)_traitTokensByIdentifier, "objectForKey:", a2);
  if (!result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", a2);
    if (result)
    {
      result = objc_msgSend(a3, "isEqual:", result);
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)_traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified
{
  void (*v1)(_QWORD, _QWORD, _QWORD);
  uint64_t *v2;
  void (*v4[6])(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v1 = (void (*)(_QWORD, _QWORD, _QWORD))a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3052000000;
    v8 = __Block_byref_object_copy__115;
    v9 = __Block_byref_object_dispose__115;
    v10 = 0;
    v2 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](a1);
    v4[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v4[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v4[2] = (void (*)(_QWORD, _QWORD, _QWORD))__96__UITraitCollection__traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified__block_invoke;
    v4[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC3D8;
    v4[4] = v1;
    v4[5] = (void (*)(_QWORD, _QWORD, _QWORD))&v5;
    _UITraitTokenSetEnumerate(v2, v4);
    v1 = (void (*)(_QWORD, _QWORD, _QWORD))v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

void __96__UITraitCollection__traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2), 0, (uint64_t)&v7);
  if (*((_QWORD *)&v7 + 1) && (v10 & 2) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    v13 = v9;
    *(_QWORD *)&v14 = v10;
    v4 = -[UITraitCollection _valueForTraitWithMetadata:](v3, (uint64_t)&v11);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      v14 = v7;
      v15 = v8;
      v16 = v9;
      v17 = v10;
      *(_QWORD *)&v11 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v11 + 1) = 3221225472;
      *(_QWORD *)&v12 = __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke;
      *((_QWORD *)&v12 + 1) = &unk_1E16CC640;
      *(_QWORD *)&v13 = v5;
      *((_QWORD *)&v13 + 1) = v4;
      v6 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)&v11);
    }
    else
    {
      v11 = v7;
      v12 = v8;
      v13 = v9;
      *(_QWORD *)&v14 = v10;
      v6 = +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, (uint64_t)v4, (uint64_t)&v11);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6;
  }
}

void *__41__UITraitCollection__valueForTraitNamed___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return a2;
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  int8x16_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  int8x16_t v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  _UIGetTraitMetadata((CFNumberRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2), 0, (uint64_t)&v11);
  if (*((_QWORD *)&v11 + 1) && (v14 & 2) != 0 && (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v5 = (__CFString *)-[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)&v7);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
    -[UITraitCollection _setValue:forTraitWithMetadata:](v6, v5, (uint64_t)&v7, v13);
  }
}

void __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  int8x16_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  int8x16_t v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  _UIGetTraitMetadata((CFNumberRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2), 0, (uint64_t)&v11);
  v3 = a1[4];
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
  v4 = (__CFString *)-[UITraitCollection _valueForTraitWithMetadata:](v3, (uint64_t)&v7);
  v5 = a1[5];
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
  if (v4 != -[UITraitCollection _valueForTraitWithMetadata:](v5, (uint64_t)&v7))
  {
    v6 = (*(uint64_t (**)(void))(a1[6] + 16))();
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
    -[UITraitCollection _setValue:forTraitWithMetadata:](v6, v4, (uint64_t)&v7, v13);
  }
}

void __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_4(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _OWORD v8[3];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int8x16_t v12;
  uint64_t v13;

  if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 40), a2))
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    _UIGetTraitMetadata((CFNumberRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2), 0, (uint64_t)&v10);
    v4 = (_QWORD *)v12.i64[1];
    if ((v13 & 1) != 0)
    {
      switch(*((_QWORD *)&v10 + 1))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          v4 = *(_QWORD **)v12.i64[1];
          break;
        default:
          v5 = v11;
          v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), CFSTR("UITrait_Internal.h"), 94, CFSTR("Data type is unknown for trait %@"), v5);
          v4 = 0;
          break;
      }
    }
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8[0] = v10;
    v8[1] = v11;
    v8[2] = v12;
    v9 = v13;
    -[UITraitCollection _setValue:forTraitWithMetadata:](v7, v4, (uint64_t)v8, v12);
  }
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4A8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4A8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4A8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_4()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 3;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4C8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4C8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4C8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_5()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 4;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4D8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4D8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4D8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_6()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 5;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4E8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4E8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4E8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_7()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 6;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E4F8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E4F8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E4F8 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_8()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 7;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E508 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E508;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E508 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_9()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 8;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E518 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E518;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E518 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_10()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 9;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E528 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E528;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E528 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_11()
{
  char *v0;
  void *v1;
  char *v2;
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v9 = xmmword_1866823B8;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  v5 = xmmword_186682378;
  v6 = unk_186682388;
  v7 = xmmword_186682398;
  v8 = unk_1866823A8;
  v3[1] = *((_QWORD *)&_UIBuiltinTraitStorageUnspecified + 1);
  v4 = unk_186682368;
  v3[0] = 10;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E538 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E538;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(_BYTE *)(qword_1ECD7E538 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithDisplayGamut:(UIDisplayGamut)displayGamut
{
  char *v4;
  void *v5;
  uint64_t *v6;
  __int128 v7;
  UIDisplayGamut v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (displayGamut == UIDisplayGamutUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (displayGamut == UIDisplayGamutP3)
  {
    if (qword_1ECD7E590 != -1)
      dispatch_once(&qword_1ECD7E590, &__block_literal_global_187);
    return (UITraitCollection *)qword_1ECD7E588;
  }
  else if (displayGamut)
  {
    v18 = xmmword_1866823F8;
    v19 = unk_186682408;
    v20 = xmmword_186682418;
    v21 = -1;
    v14 = xmmword_1866823B8;
    v15 = unk_1866823C8;
    v16 = xmmword_1866823D8;
    v17 = unk_1866823E8;
    v10 = xmmword_186682378;
    v11 = unk_186682388;
    v12 = xmmword_186682398;
    v13 = unk_1866823A8;
    v7 = _UIBuiltinTraitStorageUnspecified;
    v9 = unk_186682370;
    v8 = displayGamut;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 8uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1ECD7E580 != -1)
      dispatch_once(&qword_1ECD7E580, &__block_literal_global_184);
    return (UITraitCollection *)qword_1ECD7E578;
  }
}

void __53__UITraitCollection_traitCollectionWithDisplayGamut___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v14 = xmmword_1866823F8;
  v15 = unk_186682408;
  v16 = xmmword_186682418;
  v17 = -1;
  v10 = xmmword_1866823B8;
  v11 = unk_1866823C8;
  v12 = xmmword_1866823D8;
  v13 = unk_1866823E8;
  v6 = xmmword_186682378;
  v7 = unk_186682388;
  v8 = xmmword_186682398;
  v9 = unk_1866823A8;
  v3 = _UIBuiltinTraitStorageUnspecified;
  v5 = unk_186682370;
  v4 = 0;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v3, 0, 0, 0);
  qword_1ECD7E578 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E578;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 8uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E578 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayGamut___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v14 = xmmword_1866823F8;
  v15 = unk_186682408;
  v16 = xmmword_186682418;
  v17 = -1;
  v10 = xmmword_1866823B8;
  v11 = unk_1866823C8;
  v12 = xmmword_1866823D8;
  v13 = unk_1866823E8;
  v6 = xmmword_186682378;
  v7 = unk_186682388;
  v8 = xmmword_186682398;
  v9 = unk_1866823A8;
  v3 = _UIBuiltinTraitStorageUnspecified;
  v5 = unk_186682370;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v3, 0, 0, 0);
  qword_1ECD7E588 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E588;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 8uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E588 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[13];
  uint64_t v8;

  switch(verticalSizeClass)
  {
    case UIUserInterfaceSizeClassUnspecified:
      return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
    case UIUserInterfaceSizeClassRegular:
      if (qword_1ECD7E5D0 != -1)
        dispatch_once(&qword_1ECD7E5D0, &__block_literal_global_195_0);
      return (UITraitCollection *)qword_1ECD7E5C8;
    case UIUserInterfaceSizeClassCompact:
      if (qword_1ECD7E5C0 != -1)
        dispatch_once(&qword_1ECD7E5C0, &__block_literal_global_192_0);
      return (UITraitCollection *)qword_1ECD7E5B8;
    default:
      v7[10] = xmmword_1866823F8;
      memset(&v7[11], 255, 32);
      v8 = -1;
      v7[6] = xmmword_1866823B8;
      v7[7] = unk_1866823C8;
      v7[8] = xmmword_1866823D8;
      v7[9] = unk_1866823E8;
      memset(&v7[2], 0, 32);
      v7[5] = unk_1866823A8;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186682368;
      v7[4] = (unint64_t)verticalSizeClass;
      v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      v6 = (uint64_t *)(v4 + 248);
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v4 + 35) = 0;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 5uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
  }
}

void __58__UITraitCollection_traitCollectionWithVerticalSizeClass___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[13];
  uint64_t v4;

  v3[10] = xmmword_1866823F8;
  memset(&v3[11], 255, 32);
  v4 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v3[9] = unk_1866823E8;
  memset(&v3[2], 0, 32);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v3[4] = 1uLL;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5B8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5B8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 5uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5B8 + 288) |= 1u;
}

void __58__UITraitCollection_traitCollectionWithVerticalSizeClass___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[13];
  uint64_t v4;

  v3[10] = xmmword_1866823F8;
  memset(&v3[11], 255, 32);
  v4 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v3[9] = unk_1866823E8;
  memset(&v3[2], 0, 32);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v3[4] = 2uLL;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5C8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5C8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 5uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5C8 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithLayoutDirection:(UITraitEnvironmentLayoutDirection)layoutDirection
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[5];
  UITraitEnvironmentLayoutDirection v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (layoutDirection == UITraitEnvironmentLayoutDirectionUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (layoutDirection == UITraitEnvironmentLayoutDirectionRightToLeft)
  {
    if (qword_1ECD7E610 != -1)
      dispatch_once(&qword_1ECD7E610, &__block_literal_global_203_0);
    return (UITraitCollection *)qword_1ECD7E608;
  }
  else if (layoutDirection)
  {
    v14 = xmmword_1866823F8;
    v15 = unk_186682408;
    v16 = xmmword_186682418;
    v17 = -1;
    v10 = xmmword_1866823B8;
    v11 = unk_1866823C8;
    v12 = xmmword_1866823D8;
    v13 = unk_1866823E8;
    memset(&v7[2], 0, 48);
    v9 = unk_1866823B0;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186682368;
    v8 = layoutDirection;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 2uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1ECD7E600 != -1)
      dispatch_once(&qword_1ECD7E600, &__block_literal_global_200_1);
    return (UITraitCollection *)qword_1ECD7E5F8;
  }
}

void __56__UITraitCollection_traitCollectionWithLayoutDirection___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[5];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = xmmword_1866823F8;
  v11 = unk_186682408;
  v12 = xmmword_186682418;
  v13 = -1;
  v6 = xmmword_1866823B8;
  v7 = unk_1866823C8;
  v8 = xmmword_1866823D8;
  v9 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v5 = unk_1866823B0;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 0;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E5F8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E5F8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 2uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E5F8 + 288) |= 1u;
}

void __56__UITraitCollection_traitCollectionWithLayoutDirection___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[5];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = xmmword_1866823F8;
  v11 = unk_186682408;
  v12 = xmmword_186682418;
  v13 = -1;
  v6 = xmmword_1866823B8;
  v7 = unk_1866823C8;
  v8 = xmmword_1866823D8;
  v9 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v5 = unk_1866823B0;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E608 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E608;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 2uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E608 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithForceTouchCapability:(UIForceTouchCapability)capability
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[5];
  uint64_t v8;
  UIForceTouchCapability v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  switch(capability)
  {
    case UIForceTouchCapabilityUnknown:
      return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
    case UIForceTouchCapabilityAvailable:
      if (qword_1ECD7E630 != -1)
        dispatch_once(&qword_1ECD7E630, &__block_literal_global_207);
      return (UITraitCollection *)qword_1ECD7E628;
    case UIForceTouchCapabilityUnavailable:
      if (qword_1ECD7E620 != -1)
        dispatch_once(&qword_1ECD7E620, &__block_literal_global_204_0);
      return (UITraitCollection *)qword_1ECD7E618;
    default:
      v14 = xmmword_1866823F8;
      v15 = unk_186682408;
      v16 = xmmword_186682418;
      v17 = -1;
      v10 = xmmword_1866823B8;
      v11 = unk_1866823C8;
      v12 = xmmword_1866823D8;
      v13 = unk_1866823E8;
      memset(&v7[2], 0, 48);
      v8 = unk_1866823A8;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186682368;
      v9 = capability;
      v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      v6 = (uint64_t *)(v4 + 248);
      v5 = (void *)*((_QWORD *)v4 + 31);
      if (v5)

      *((_QWORD *)v4 + 35) = 0;
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 6uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
  }
}

void __61__UITraitCollection_traitCollectionWithForceTouchCapability___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[5];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = xmmword_1866823F8;
  v11 = unk_186682408;
  v12 = xmmword_186682418;
  v13 = -1;
  v6 = xmmword_1866823B8;
  v7 = unk_1866823C8;
  v8 = xmmword_1866823D8;
  v9 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v4 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E618 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E618;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 6uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E618 + 288) |= 1u;
}

void __61__UITraitCollection_traitCollectionWithForceTouchCapability___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[5];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = xmmword_1866823F8;
  v11 = unk_186682408;
  v12 = xmmword_186682418;
  v13 = -1;
  v6 = xmmword_1866823B8;
  v7 = unk_1866823C8;
  v8 = xmmword_1866823D8;
  v9 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v4 = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v5 = 2;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E628 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E628;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 6uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E628 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithDisplayCornerRadius:(double)a3
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[6];
  uint64_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  if (a3 == -1.0)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v13 = xmmword_1866823F8;
  v14 = unk_186682408;
  v15 = xmmword_186682418;
  v16 = -1;
  v8 = 0;
  v10 = unk_1866823C8;
  v11 = xmmword_1866823D8;
  v12 = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = unk_186682368;
  v9 = a3;
  v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v6 = (uint64_t *)(v4 + 248);
  v5 = (void *)*((_QWORD *)v4 + 31);
  if (v5)

  *((_QWORD *)v4 + 35) = 0;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)(v4 + 264) = 0u;
  _UITraitTokenSetInsert(v6, 0x12uLL, (__n128)0);
  v4[288] |= 1u;
  return (UITraitCollection *)v4;
}

+ (UITraitCollection)traitCollectionWithLegibilityWeight:(UILegibilityWeight)legibilityWeight
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[7];
  UILegibilityWeight v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  if (legibilityWeight == UILegibilityWeightUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (legibilityWeight == UILegibilityWeightBold)
  {
    if (qword_1ECD7E650 != -1)
      dispatch_once(&qword_1ECD7E650, &__block_literal_global_213_0);
    return (UITraitCollection *)qword_1ECD7E648;
  }
  else if (legibilityWeight)
  {
    v12 = xmmword_1866823F8;
    v13 = unk_186682408;
    v14 = xmmword_186682418;
    v15 = -1;
    v7[6] = xmmword_1866823B8;
    v9 = unk_1866823D0;
    v10 = xmmword_1866823D8;
    v11 = unk_1866823E8;
    memset(&v7[2], 0, 48);
    v7[5] = unk_1866823A8;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186682368;
    v8 = legibilityWeight;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xBuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1ECD7E640 != -1)
      dispatch_once(&qword_1ECD7E640, &__block_literal_global_210);
    return (UITraitCollection *)qword_1ECD7E638;
  }
}

void __57__UITraitCollection_traitCollectionWithLegibilityWeight___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[7];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v8 = xmmword_1866823F8;
  v9 = unk_186682408;
  v10 = xmmword_186682418;
  v11 = -1;
  v3[6] = xmmword_1866823B8;
  v5 = unk_1866823D0;
  v6 = xmmword_1866823D8;
  v7 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 0;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E638 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E638;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xBuLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E638 + 288) |= 1u;
}

void __57__UITraitCollection_traitCollectionWithLegibilityWeight___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[7];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v8 = xmmword_1866823F8;
  v9 = unk_186682408;
  v10 = xmmword_186682418;
  v11 = -1;
  v3[6] = xmmword_1866823B8;
  v5 = unk_1866823D0;
  v6 = xmmword_1866823D8;
  v7 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E648 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E648;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xBuLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E648 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithActiveAppearance:(UIUserInterfaceActiveAppearance)userInterfaceActiveAppearance
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[11];
  UIUserInterfaceActiveAppearance v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  if (userInterfaceActiveAppearance == UIUserInterfaceActiveAppearanceUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (userInterfaceActiveAppearance == UIUserInterfaceActiveAppearanceActive)
  {
    if (qword_1ECD7E660 != -1)
      dispatch_once(&qword_1ECD7E660, &__block_literal_global_214_0);
    return (UITraitCollection *)qword_1ECD7E658;
  }
  else
  {
    v7[10] = xmmword_1866823F8;
    v9 = unk_186682410;
    v10 = xmmword_186682418;
    v11 = -1;
    v7[6] = xmmword_1866823B8;
    v7[7] = unk_1866823C8;
    v7[8] = xmmword_1866823D8;
    v7[9] = unk_1866823E8;
    memset(&v7[2], 0, 48);
    v7[5] = unk_1866823A8;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186682368;
    v8 = userInterfaceActiveAppearance;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xCuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
}

void __57__UITraitCollection_traitCollectionWithActiveAppearance___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[11];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v3[10] = xmmword_1866823F8;
  v5 = unk_186682410;
  v6 = xmmword_186682418;
  v7 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v3[9] = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E658 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E658;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xCuLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E658 + 288) |= 1u;
}

+ (id)_traitCollectionWithUserInterfaceActiveAppearance:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithActiveAppearance:](UITraitCollection, "traitCollectionWithActiveAppearance:", a3);
}

+ (UITraitCollection)traitCollectionWithAccessibilityContrast:(UIAccessibilityContrast)accessibilityContrast
{
  char *v4;
  void *v5;
  uint64_t *v6;
  _OWORD v7[9];
  UIAccessibilityContrast v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  if (accessibilityContrast == UIAccessibilityContrastUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  if (accessibilityContrast == UIAccessibilityContrastHigh)
  {
    if (qword_1ECD7E680 != -1)
      dispatch_once(&qword_1ECD7E680, &__block_literal_global_218_0);
    return (UITraitCollection *)qword_1ECD7E678;
  }
  else if (accessibilityContrast)
  {
    v10 = xmmword_1866823F8;
    v11 = unk_186682408;
    v12 = xmmword_186682418;
    v13 = -1;
    v7[6] = xmmword_1866823B8;
    v7[7] = unk_1866823C8;
    v7[8] = xmmword_1866823D8;
    v9 = unk_1866823F0;
    memset(&v7[2], 0, 48);
    v7[5] = unk_1866823A8;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186682368;
    v8 = accessibilityContrast;
    v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    v6 = (uint64_t *)(v4 + 248);
    v5 = (void *)*((_QWORD *)v4 + 31);
    if (v5)

    *((_QWORD *)v4 + 35) = 0;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 9uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1ECD7E670 != -1)
      dispatch_once(&qword_1ECD7E670, &__block_literal_global_215_1);
    return (UITraitCollection *)qword_1ECD7E668;
  }
}

void __62__UITraitCollection_traitCollectionWithAccessibilityContrast___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[9];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v6 = xmmword_1866823F8;
  v7 = unk_186682408;
  v8 = xmmword_186682418;
  v9 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v5 = unk_1866823F0;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 0;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E668 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E668;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 9uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E668 + 288) |= 1u;
}

void __62__UITraitCollection_traitCollectionWithAccessibilityContrast___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[9];
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v6 = xmmword_1866823F8;
  v7 = unk_186682408;
  v8 = xmmword_186682418;
  v9 = -1;
  v3[6] = xmmword_1866823B8;
  v3[7] = unk_1866823C8;
  v3[8] = xmmword_1866823D8;
  v5 = unk_1866823F0;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186682368;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E678 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E678;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 9uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E678 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithTouchLevel:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  __int128 v7;
  uint64_t v8;
  int64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (a3 == -1)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v18 = xmmword_1866823F8;
  v19 = unk_186682408;
  v20 = xmmword_186682418;
  v21 = -1;
  v14 = xmmword_1866823B8;
  v15 = unk_1866823C8;
  v16 = xmmword_1866823D8;
  v17 = unk_1866823E8;
  v10 = xmmword_186682378;
  v11 = unk_186682388;
  v12 = xmmword_186682398;
  v13 = unk_1866823A8;
  v7 = _UIBuiltinTraitStorageUnspecified;
  v8 = -1;
  v9 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0xEuLL, (__n128)0);
  v3[288] |= 1u;
  return (UITraitCollection *)v3;
}

- (int64_t)touchLevel
{
  _UIRecordTraitUsage((unint64_t)self, 0xEuLL);
  return self->_builtinTraits.touchLevel;
}

+ (UITraitCollection)traitCollectionWithInteractionModel:(unint64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[13];
  uint64_t v8;

  if (!a3)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v7[10] = xmmword_1866823F8;
  memset(&v7[11], 255, 32);
  v8 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[3], 0, 32);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v7[2] = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0xFuLL, (__n128)0);
  v3[288] |= 1u;
  return (UITraitCollection *)v3;
}

- (unint64_t)interactionModel
{
  _UIRecordTraitUsage((unint64_t)self, 0xFuLL);
  return self->_builtinTraits.interactionModel;
}

+ (UITraitCollection)traitCollectionWithPrimaryInteractionModel:(unint64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[2];
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  if (!a3)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v17 = xmmword_1866823F8;
  v18 = unk_186682408;
  v19 = xmmword_186682418;
  v20 = -1;
  v13 = xmmword_1866823B8;
  v14 = unk_1866823C8;
  v15 = xmmword_1866823D8;
  v16 = unk_1866823E8;
  v8 = 0;
  v10 = unk_186682388;
  v11 = xmmword_186682398;
  v12 = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v9 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x10uLL, (__n128)0);
  v3[288] |= 1u;
  return (UITraitCollection *)v3;
}

+ (UITraitCollection)traitCollectionWithArtworkSubtype:(unint64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[3];
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  if (!a3)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v16 = xmmword_1866823F8;
  v17 = unk_186682408;
  v18 = xmmword_186682418;
  v19 = -1;
  v12 = xmmword_1866823B8;
  v13 = unk_1866823C8;
  v14 = xmmword_1866823D8;
  v15 = unk_1866823E8;
  v7[2] = xmmword_186682378;
  v9 = unk_186682390;
  v10 = xmmword_186682398;
  v11 = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v8 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x11uLL, (__n128)0);
  v3[288] |= 1u;
  return (UITraitCollection *)v3;
}

+ (id)_traitCollectionWithUserInterfaceRenderingMode:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[10];
  uint64_t v8;
  int64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (!a3)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  v8 = -1;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v9 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x17uLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

- (unint64_t)_semanticContext
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    _UIRecordTraitUsage(result, 0x13uLL);
    return *(_QWORD *)(v1 + 128);
  }
  return result;
}

+ (id)_traitCollectionWithPresentationSemanticContext:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[8];
  int64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (!a3)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  v11 = xmmword_1866823F8;
  v12 = unk_186682408;
  v13 = xmmword_186682418;
  v14 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v9 = -1;
  v10 = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v8 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x14uLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

+ (id)_traitCollectionWithSplitViewControllerContext:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[8];
  uint64_t v8;
  int64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (a3 == -1)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  v11 = xmmword_1866823F8;
  v12 = unk_186682408;
  v13 = xmmword_186682418;
  v14 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v8 = 0;
  v10 = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v9 = a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x15uLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

- (unint64_t)_selectionIsKey
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    _UIRecordTraitUsage(result, 0x19uLL);
    return *(_QWORD *)(v1 + 200);
  }
  return result;
}

+ (id)_traitCollectionWithBacklightLuminance:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[12];
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  if (a3 == -1)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  v7[10] = xmmword_1866823F8;
  v7[11] = unk_186682408;
  v8 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v9 = a3;
  v10 = -1;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x1AuLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

+ (UITraitCollection)traitCollectionWithToolbarItemPresentationSize:(UINSToolbarItemPresentationSize)toolbarItemPresentationSize
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[13];
  UINSToolbarItemPresentationSize v8;

  if (toolbarItemPresentationSize == UINSToolbarItemPresentationSizeUnspecified)
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  v7[10] = xmmword_1866823F8;
  memset(&v7[11], 255, 32);
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v8 = toolbarItemPresentationSize;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0xDuLL, (__n128)0);
  v3[288] |= 1u;
  return (UITraitCollection *)v3;
}

- (UINSToolbarItemPresentationSize)toolbarItemPresentationSize
{
  _UIRecordTraitUsage((unint64_t)self, 0xDuLL);
  return self->_builtinTraits.toolbarItemPresentationSize;
}

- (void)setToolbarItemPresentationSize:(int64_t)a3
{
  __n128 v3;
  uint16x8_t **p_specifiedTraitTokens;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.toolbarItemPresentationSize = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xDuLL, (int8x16_t)v3);
    else
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xDuLL, v3);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITraitCollection_NonARC.m"), 2598, CFSTR("-%@ can only be called from inside a UITraitMutations block"), NSStringFromSelector(a2));
  }
  else
  {
    v7 = setToolbarItemPresentationSize____s_category;
    if (!setToolbarItemPresentationSize____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&setToolbarItemPresentationSize____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = NSStringFromSelector(a2);
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

+ (id)_traitCollectionForSidebarAppearance
{
  char *v2;
  void *v3;
  uint64_t *v4;
  _OWORD v6[7];
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  objc_opt_self();
  v11 = xmmword_1866823F8;
  v12 = unk_186682408;
  v13 = xmmword_186682418;
  v14 = -1;
  v6[6] = xmmword_1866823B8;
  v7 = unk_1866823C8;
  v9 = xmmword_1866823D8;
  v10 = unk_1866823E8;
  memset(&v6[2], 0, 48);
  v6[5] = unk_1866823A8;
  v6[0] = _UIBuiltinTraitStorageUnspecified;
  v6[1] = *(_OWORD *)&qword_186682368;
  v8 = 2;
  v2 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v6, 0, 0, 0);
  v4 = (uint64_t *)(v2 + 248);
  v3 = (void *)*((_QWORD *)v2 + 31);
  if (v3)

  *((_QWORD *)v2 + 35) = 0;
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  _UITraitTokenSetInsert(v4, 0x13uLL, (__n128)0);
  v2[288] |= 1u;
  return v2;
}

+ (id)_traitCollectionWithVibrancy:(int64_t)a3
{
  char *v3;
  void *v4;
  uint64_t *v5;
  _OWORD v7[13];
  uint64_t v8;

  if (a3 == -1)
    return (id)+[UITraitCollection _emptyTraitCollection]();
  memset(&v7[11], 255, 32);
  v8 = -1;
  v7[6] = xmmword_1866823B8;
  v7[7] = unk_1866823C8;
  v7[8] = xmmword_1866823D8;
  v7[9] = unk_1866823E8;
  memset(&v7[2], 0, 48);
  v7[5] = unk_1866823A8;
  v7[0] = _UIBuiltinTraitStorageUnspecified;
  v7[1] = *(_OWORD *)&qword_186682368;
  v7[10] = (unint64_t)a3;
  v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
  v5 = (uint64_t *)(v3 + 248);
  v4 = (void *)*((_QWORD *)v3 + 31);
  if (v4)

  *((_QWORD *)v3 + 35) = 0;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  _UITraitTokenSetInsert(v5, 0x16uLL, (__n128)0);
  v3[288] |= 1u;
  return v3;
}

+ (id)_traitCollectionWithContrast:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithAccessibilityContrast:](UITraitCollection, "traitCollectionWithAccessibilityContrast:", a3);
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 1;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6A8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6A8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6A8 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_2()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 2;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6B8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6B8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6B8 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_5()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 5;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6E8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6E8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6E8 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_6()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 6;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E6F8 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E6F8;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E6F8 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_11()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 65539;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E748 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E748;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E748 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_12()
{
  char *v0;
  void *v1;
  char *v2;
  _OWORD v3[6];
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = xmmword_1866823F8;
  v10 = unk_186682408;
  v11 = xmmword_186682418;
  v12 = -1;
  v5 = 0xBFF0000000000000;
  v6 = unk_1866823C8;
  v7 = xmmword_1866823D8;
  v8 = unk_1866823E8;
  memset(&v3[2], 0, 48);
  v3[5] = unk_1866823A8;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186682368;
  v4 = 65540;
  v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1ECD7E758 = (uint64_t)v0;
  v1 = (void *)*((_QWORD *)v0 + 31);
  if (v1)
  {

    v0 = (char *)qword_1ECD7E758;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  v2 = v0 + 248;
  *((_QWORD *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(_BYTE *)(qword_1ECD7E758 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithTypesettingLanguage:(NSString *)language
{
  return +[UITraitCollection traitCollectionWithObject:forTrait:](UITraitCollection, "traitCollectionWithObject:forTrait:", language, objc_opt_self());
}

- (void)setTypesettingLanguage:(id)a3
{
  -[UITraitCollection setObject:forTrait:](self, "setObject:forTrait:", (id)objc_msgSend(a3, "copy"), objc_opt_self());
}

+ (id)_traitCollectionWithTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  return +[UITraitCollection traitCollectionWithCGFloatValue:forTrait:](UITraitCollection, "traitCollectionWithCGFloatValue:forTrait:", objc_opt_self(), a3);
}

- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  -[UITraitCollection setCGFloatValue:forTrait:](self, "setCGFloatValue:forTrait:", objc_opt_self(), a3);
}

+ (id)_traitCollectionWithEnvironmentWrapper:(id)a3
{
  if (a3)
    return -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, a3);
  else
    return (id)+[UITraitCollection _emptyTraitCollection]();
}

uint64_t __61__UITraitCollection__traitCollectionWithValue_forTraitNamed___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ invoked with non-NSNumber argument (%@) for built-in trait"), NSStringFromSelector(*(SEL *)(a1 + 40)), *(_QWORD *)(a1 + 32));
  return *(_QWORD *)(a1 + 32);
}

+ (uint64_t)_defaultTraitCollection
{
  objc_opt_self();
  if (qword_1ECD7E788 != -1)
    dispatch_once(&qword_1ECD7E788, &__block_literal_global_288);
  return qword_1ECD7E780;
}

UITraitCollection *__44__UITraitCollection__defaultTraitCollection__block_invoke()
{
  UIScreen *v0;
  UITraitCollection *result;
  _QWORD v2[5];

  v0 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__UITraitCollection__defaultTraitCollection__block_invoke_2;
  v2[3] = &unk_1E16CC690;
  v2[4] = v0;
  result = +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v2);
  qword_1ECD7E780 = (uint64_t)result;
  return result;
}

uint64_t __44__UITraitCollection__defaultTraitCollection__block_invoke_2(uint64_t a1, void *a2)
{
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(*(id *)(a1 + 32), "scale");
    objc_msgSend(a2, "setDisplayScale:");
  }
  return objc_msgSend(a2, "setDisplayGamut:", objc_msgSend(*(id *)(a1 + 32), "gamut"));
}

+ (UITraitCollection)traitCollectionWithImageDynamicRange:(UIImageDynamicRange)imageDynamicRange
{
  return +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", imageDynamicRange, objc_opt_self());
}

- (UIImageDynamicRange)imageDynamicRange
{
  return -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_self());
}

- (void)setImageDynamicRange:(int64_t)a3
{
  -[UITraitCollection setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_self());
}

+ (UITraitCollection)traitCollectionWithSceneCaptureState:(UISceneCaptureState)sceneCaptureState
{
  return +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", sceneCaptureState, objc_opt_self());
}

- (UISceneCaptureState)sceneCaptureState
{
  return -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_self());
}

+ (UITraitCollection)traitCollectionWithListEnvironment:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", a3, objc_opt_self());
}

- (int64_t)listEnvironment
{
  return -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_self());
}

- (void)setListEnvironment:(int64_t)a3
{
  -[UITraitCollection setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_self());
}

+ (id)_traitCollectionWithInterfaceProtectionState:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", a3, objc_opt_class());
}

- (int64_t)_interfaceProtectionState
{
  return -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_class());
}

- (int64_t)_headroomUsage
{
  void *v3;
  int64_t v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UITraitCollection valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", v3);

  return v4;
}

+ (id)_traitCollectionWithHeadroomUsage:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
