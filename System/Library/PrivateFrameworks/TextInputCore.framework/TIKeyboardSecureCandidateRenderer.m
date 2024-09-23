@implementation TIKeyboardSecureCandidateRenderer

- (TIKeyboardSecureCandidateRenderer)init
{
  void *v3;
  void *v4;
  TIKeyboardSecureCandidateRenderer *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardSecureCandidateRenderer initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v4);

  return v5;
}

- (id)initForLocalizedStrings
{
  TIKeyboardSecureCandidateRenderer *v2;
  void *v3;
  uint64_t v4;
  NSString *localeIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  v2 = -[TIKeyboardSecureCandidateRenderer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v2->_localeIdentifier;
    v2->_localeIdentifier = (NSString *)v4;

  }
  return v2;
}

- (TIKeyboardSecureCandidateRenderer)initWithLocaleIdentifier:(id)a3
{
  id v5;
  TIKeyboardSecureCandidateRenderer *v6;
  TIKeyboardSecureCandidateRenderer *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *secureCandidateCache;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  v6 = -[TIKeyboardSecureCandidateRenderer init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TIKeyboardSecureCandidateRenderer createContext](v6, "createContext");
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    secureCandidateCache = v7->_secureCandidateCache;
    v7->_secureCandidateCache = v8;

    objc_storeStrong((id *)&v7->_localeIdentifier, a3);
    v10 = (id)__allSecureRenderers;
    objc_sync_enter(v10);
    if (__allSecureRenderers)
    {
      objc_msgSend((id)__allSecureRenderers, "addObject:", v7);
    }
    else
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v7, 0);
      v12 = (void *)__allSecureRenderers;
      __allSecureRenderers = v11;

    }
    objc_sync_exit(v10);

  }
  return v7;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)__allSecureRenderers;
  objc_sync_enter(v3);
  objc_msgSend((id)__allSecureRenderers, "removeObject:", self);
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  -[TIKeyboardSecureCandidateRenderer dealloc](&v4, sel_dealloc);
}

- (void)createContext
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CAContext *v8;
  CAContext *context;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9AE50];
  v4 = *MEMORY[0x1E0CD2A28];
  v10[0] = *MEMORY[0x1E0CD2A40];
  v10[1] = v4;
  v5 = *MEMORY[0x1E0C9AE40];
  v11[0] = v3;
  v11[1] = v5;
  v6 = *MEMORY[0x1E0CD2A38];
  v10[2] = *MEMORY[0x1E0CD2A30];
  v10[3] = v6;
  v11[2] = v3;
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E0CD2A10];
  v11[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v7);
  v8 = (CAContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v8;

}

- (void)setLocaleIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_localeIdentifier) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_localeIdentifier, a3);
    -[TIKeyboardSecureCandidateRenderer clearSecureCandidateCache](self, "clearSecureCandidateCache");
  }

}

- (id)localizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("SecureCandidate"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v3) & 1) != 0)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1EA1081D0, CFSTR("SecureCandidate"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (__CFArray)arrayOfContexts:(unint64_t)a3 withRenderTraits:(id)a4
{
  id v5;
  __CFArray *Mutable;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  size_t v22;
  double v23;
  double v24;
  double v25;
  CGContext *v26;
  double v27;
  CGFloat v28;
  CGFloat v29;

  v5 = a4;
  if (arrayOfContexts_withRenderTraits__onceToken != -1)
    dispatch_once(&arrayOfContexts_withRenderTraits__onceToken, &__block_literal_global_403);
  Mutable = CFArrayCreateMutable(0, a3, MEMORY[0x1E0C9B378]);
  if (a3)
  {
    if (objc_msgSend(v5, "maxCellCount") >= 1)
    {
      v7 = objc_msgSend(v5, "maxCellCount");
      if (v7 < a3)
        a3 = v7;
    }
    v8 = a3;
    if (objc_msgSend(v5, "sharedCellCount"))
      v8 = objc_msgSend(v5, "sharedCellCount") + a3;
    objc_msgSend(v5, "resultCountToSingleCellWidth");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v5, "resultCountToSingleCellWidth");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      objc_msgSend(v5, "resultCountToSingleCellWidth");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 <= a3)
        objc_msgSend(v13, "lastObject");
      else
        objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v5, "cellRenderingStyle") & 1) != 0)
      {
        if (v8 == 1)
        {
          objc_msgSend(v5, "cellWidthOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v16;
          v17 = (_QWORD *)MEMORY[0x1E0DBE398];
        }
        else if (v8 == 2)
        {
          objc_msgSend(v5, "cellWidthOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v16;
          v17 = (_QWORD *)MEMORY[0x1E0DBE3C0];
        }
        else
        {
          objc_msgSend(v5, "cellWidthOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v16;
          if (v8 == 3)
            v17 = (_QWORD *)MEMORY[0x1E0DBE3B0];
          else
            v17 = (_QWORD *)MEMORY[0x1E0DBE3D0];
        }
      }
      else if (v8 == 1)
      {
        objc_msgSend(v5, "cellWidthOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v17 = (_QWORD *)MEMORY[0x1E0DBE3A0];
      }
      else
      {
        objc_msgSend(v5, "cellWidthOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        if (v8 == 2)
          v17 = (_QWORD *)MEMORY[0x1E0DBE3C8];
        else
          v17 = (_QWORD *)MEMORY[0x1E0DBE3B8];
      }
      objc_msgSend(v16, "objectForKey:", *v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v15;
    objc_msgSend(v15, "doubleValue");
    v20 = v19;

    for (; a3; --a3)
    {
      objc_msgSend(v5, "screenScale");
      v22 = (unint64_t)fmax(ceil(v20 * v21), 1.0);
      objc_msgSend(v5, "singleCellHeight");
      v24 = v23;
      objc_msgSend(v5, "screenScale");
      v26 = CGBitmapContextCreate(0, v22, (unint64_t)fmax(ceil(v24 * v25), 1.0), 8uLL, 0, (CGColorSpaceRef)arrayOfContexts_withRenderTraits__colorSpace, 2u);
      objc_msgSend(v5, "screenScale");
      v28 = v27;
      objc_msgSend(v5, "screenScale");
      CGContextScaleCTM(v26, v28, v29);
      CFArrayAppendValue(Mutable, v26);
      CGContextRelease(v26);
    }
  }

  return Mutable;
}

- (__CFArray)imagesFromContexts:(__CFArray *)a3
{
  CFIndex Count;
  __CFArray *Mutable;
  unint64_t i;
  CGContext *ValueAtIndex;
  CGImageRef Image;

  Count = CFArrayGetCount(a3);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
  for (i = 0; i < CFArrayGetCount(a3); ++i)
  {
    ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a3, i);
    Image = CGBitmapContextCreateImage(ValueAtIndex);
    CFArrayAppendValue(Mutable, Image);
    CGImageRelease(Image);
  }
  return Mutable;
}

- (id)_truncationSentinel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD __buf[3];

  __buf[2] = *MEMORY[0x1E0C80C00];
  __buf[0] = 0;
  __buf[1] = 0;
  arc4random_buf(__buf, 0x10uLL);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", __buf);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("*%@*"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFArray)imagesFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outAccessibilityLabels:(id *)a5 outWidths:(id)a6
{
  id v9;
  id v10;
  id v11;
  TIKeyboardSecureCandidateRenderer *v12;
  NSObject *v13;
  void *v14;
  __CFArray *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFArray *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  TIKeyboardSecureCandidateRenderer *v38;
  void *v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v12 = self;
    TIOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_msgSend(v9, "count");
      objc_msgSend(v10, "singleCellWidth");
      v34 = v33;
      objc_msgSend(v10, "singleCellHeight");
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%s DEBUG:ProactiveQuickType:TI: Secure rendering %lu items (width: %f, height: %f)"), "-[TIKeyboardSecureCandidateRenderer imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:]", v32, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v36;
      _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    self = v12;
  }
  v39 = v11;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "truncationSentinel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }
  v38 = self;
  v41 = v10;
  v15 = -[TIKeyboardSecureCandidateRenderer arrayOfContexts:withRenderTraits:](self, "arrayOfContexts:withRenderTraits:", objc_msgSend(v9, "count"), v10);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v23, "secureHeader");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v23, "secureContent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v23, "secureHeader");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v27);

            objc_msgSend(v23, "secureContent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v28);

          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v20);
  }

  +[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:](TIKeyboardSecureCandidateTextRendering, "drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:", v16, v17, v15, v41, v37, v39);
  v29 = -[TIKeyboardSecureCandidateRenderer imagesFromContexts:](v38, "imagesFromContexts:", v15);
  CFRelease(v15);
  if (a5)
  {
    -[TIKeyboardSecureCandidateRenderer accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:](v38, "accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:", v16, v17, v37);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  void *v26;
  id v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    v27 = v9;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
      {
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1EA1081D0);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      objc_msgSend(v8, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length") && objc_msgSend(v15, "length"))
      {
        v16 = v10;
        v17 = v8;
        -[TIKeyboardSecureCandidateRenderer localizedStringForKey:](self, "localizedStringForKey:", CFSTR("PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@%@"), &v29, v13, v15);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = v29;
        v21 = &stru_1EA1081D0;
        if (v19)
          v21 = v19;
        v22 = v21;

        if (v20)
        {
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          TIOSLogFacility();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISecureCandidateLogging: ERROR: invalid localized format for key PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL: %@"), "-[TIKeyboardSecureCandidateRenderer accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:]", v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v31 = v26;
            _os_log_debug_impl(&dword_1DA6F2000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }

        v8 = v17;
        v10 = v16;
        v9 = v27;
        goto LABEL_21;
      }
      if (objc_msgSend(v13, "length"))
      {
        v24 = v13;
      }
      else
      {
        if (!objc_msgSend(v15, "length"))
        {
          v22 = &stru_1EA1081D0;
          goto LABEL_21;
        }
        v24 = v15;
      }
      v22 = v24;
LABEL_21:
      objc_msgSend(v10, "addObject:", v22);

      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }

  return v10;
}

- (void)cacheAccessibilityLabel:(id)a3 forSlotID:(unsigned int)a4
{
  uint64_t v4;
  NSMutableDictionary *accessibilityLabelCache;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  accessibilityLabelCache = self->_accessibilityLabelCache;
  if (!accessibilityLabelCache)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v8 = self->_accessibilityLabelCache;
    self->_accessibilityLabelCache = v7;

    accessibilityLabelCache = self->_accessibilityLabelCache;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](accessibilityLabelCache, "setObject:forKey:", v10, v9);

}

- (id)accessibilityLabelForSlotID:(unsigned int)a3
{
  NSMutableDictionary *accessibilityLabelCache;
  void *v4;
  void *v5;

  accessibilityLabelCache = self->_accessibilityLabelCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessibilityLabelCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedApplicationNameWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getLSApplicationProxyClass_softClass;
    v13 = getLSApplicationProxyClass_softClass;
    if (!getLSApplicationProxyClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getLSApplicationProxyClass_block_invoke;
      v9[3] = &unk_1EA107058;
      v9[4] = &v10;
      __getLSApplicationProxyClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "applicationProxyForIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)slotIDsFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outWidths:(id)a5
{
  id v8;
  id v9;
  __CFArray *v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  const void *ValueAtIndex;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v26 = a5;
  v27 = v9;
  v10 = -[TIKeyboardSecureCandidateRenderer imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:](self, "imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:", v8, v9, &v29);
  v11 = v29;
  v12 = objc_msgSend(v11, "count");
  v28 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = MEMORY[0x1E0C81028];
  while (v14 < CFArrayGetCount(v10))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v10, v14);
    -[TIKeyboardSecureCandidateRenderer context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "createSlot");

    if (!(_DWORD)v18)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
        _os_log_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEFAULT, "%s  slotID is 0, recreating remote context", buf, 0xCu);
      }
      -[TIKeyboardSecureCandidateRenderer recreateContext](self, "recreateContext");
      -[TIKeyboardSecureCandidateRenderer context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v19, "createSlot");

      if (!(_DWORD)v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
          _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  slotID is still 0 after recreating remote context", buf, 0xCu);
        }
        break;
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
      v32 = 1024;
      v33 = v18;
      _os_log_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEFAULT, "%s  Created slotID %X", buf, 0x12u);
    }
    if (!v14)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISecureCandidateLogging: proactive candidate first slotID = %ud"), "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]", v18);
          v25 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v25;
          _os_log_debug_impl(&dword_1DA6F2000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }
    }
    -[TIKeyboardSecureCandidateRenderer context](self, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forSlot:", ValueAtIndex, v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v22);

    if (v11)
    {
      if (v14 < v12)
      {
        objc_msgSend(v11, "objectAtIndex:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardSecureCandidateRenderer cacheAccessibilityLabel:forSlotID:](self, "cacheAccessibilityLabel:forSlotID:", v23, v18);

      }
    }
    ++v14;
  }
  CFRelease(v10);

  return v13;
}

- (CGImage)imageForSendCurrentLocationWithRenderTraits:(id)a3
{
  id v4;
  __CFArray *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  __CFArray *v14;
  const void *ValueAtIndex;
  CGImage *v16;
  void *v18;
  id v19;
  __CFString *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TIKeyboardSecureCandidateRenderer arrayOfContexts:withRenderTraits:](self, "arrayOfContexts:withRenderTraits:", 1, v4);
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardSecureCandidateRenderer localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SEND_CURRENT_LOCATION_BUTTON_CAPTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), &v19, CFSTR(""));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v10 = &stru_1EA1081D0;
  if (v8)
    v10 = v8;
  v11 = v10;

  if (v9)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISecureCandidateLogging: ERROR: invalid localized format for key SEND_CURRENT_LOCATION_BUTTON_CAPTION: %@"), "-[TIKeyboardSecureCandidateRenderer imageForSendCurrentLocationWithRenderTraits:]", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v20 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:](TIKeyboardSecureCandidateTextRendering, "drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:", &unk_1EA13FEC8, v13, v5, v4, 0, 0);

  v14 = -[TIKeyboardSecureCandidateRenderer imagesFromContexts:](self, "imagesFromContexts:", v5);
  CFRelease(v5);
  ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
  v16 = (CGImage *)CFRetain(ValueAtIndex);
  CFRelease(v14);

  return v16;
}

- (unsigned)slotIDForSendCurrentLocationWithRenderTraits:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CGImage *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardSecureCandidateRenderer context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createSlot");

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[TIKeyboardSecureCandidateRenderer slotIDForSendCurrentLocationWithRenderTraits:]";
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Created slotID %X", buf, 0x12u);
  }
  v7 = -[TIKeyboardSecureCandidateRenderer imageForSendCurrentLocationWithRenderTraits:](self, "imageForSendCurrentLocationWithRenderTraits:", v4);

  -[TIKeyboardSecureCandidateRenderer localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SEND_CURRENT_LOCATION_BUTTON_ACCESSIBILITY_LABEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardSecureCandidateRenderer cacheAccessibilityLabel:forSlotID:](self, "cacheAccessibilityLabel:forSlotID:", v8, v6);
  -[TIKeyboardSecureCandidateRenderer context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSlot:", v7, v6);

  CFRelease(v7);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISecureCandidateLogging: send current location slotID = %ud"), "-[TIKeyboardSecureCandidateRenderer slotIDForSendCurrentLocationWithRenderTraits:]", v6);
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

  return v6;
}

- (void)recreateContext
{
  -[TIKeyboardSecureCandidateRenderer clearSecureCandidateCache](self, "clearSecureCandidateCache");
  -[TIKeyboardSecureCandidateRenderer createContext](self, "createContext");
}

- (void)clearSecureCandidateCache
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x1E0C81028];
      *(_QWORD *)&v7 = 136315394;
      v17 = v7;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_msgSend(v12, "unsignedIntValue");
            *(_DWORD *)buf = v17;
            v23 = "-[TIKeyboardSecureCandidateRenderer clearSecureCandidateCache]";
            v24 = 1024;
            v25 = v13;
            _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEFAULT, "%s  Deleted slotID %X", buf, 0x12u);
          }
          -[TIKeyboardSecureCandidateRenderer context](self, "context", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deleteSlot:", objc_msgSend(v12, "unsignedIntValue"));

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v8);
    }

    -[NSMutableDictionary removeAllObjects](self->_accessibilityLabelCache, "removeAllObjects");
    -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");

    +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clearRegistrations");

  }
}

- (id)cachedCandidateForSecureCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (objc_msgSend(v4, "slotID"))
  {
    -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "slotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "slotID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setSlotID:", objc_msgSend(v4, "slotID"));
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DBDBE8];
      objc_msgSend(v4, "input");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "secureCandidateForInput:slotID:customInfoType:", v14, objc_msgSend(v4, "slotID"), objc_msgSend(v4, "customInfoType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v11)
      v15 = v11;
    else
      v15 = v4;
    v12 = v15;

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)updateCachedCandidate:(id)a3 withCandidateString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[TIKeyboardSecureCandidateRenderer cachedCandidateForSecureCandidate:](self, "cachedCandidateForSecureCandidate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidateByReplacingWithCandidate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSlotID:", objc_msgSend(v7, "slotID"));
  -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "slotID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

  return v8;
}

- (id)updateCachedCandidate:(id)a3 withStickerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setStickerIdentifier:", v6);
  objc_msgSend(v8, "setSlotID:", objc_msgSend(v7, "slotID"));
  -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v7, "slotID");

  objc_msgSend(v10, "numberWithUnsignedInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v12);

  return v8;
}

- (id)cachedPayloadForSecureCandidateSlotID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    -[TIKeyboardSecureCandidateRenderer secureCandidateCache](self, "secureCandidateCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CAContext)context
{
  return self->_context;
}

- (NSMutableDictionary)secureCandidateCache
{
  return self->_secureCandidateCache;
}

- (void)setSecureCandidateCache:(id)a3
{
  objc_storeStrong((id *)&self->_secureCandidateCache, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabelCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_secureCandidateCache, 0);
}

CGColorSpaceRef __70__TIKeyboardSecureCandidateRenderer_arrayOfContexts_withRenderTraits___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  arrayOfContexts_withRenderTraits__colorSpace = (uint64_t)result;
  return result;
}

+ (id)allRenderers
{
  id v2;
  void *v3;

  v2 = (id)__allSecureRenderers;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend((id)__allSecureRenderers, "copy");
  objc_sync_exit(v2);

  return v3;
}

@end
