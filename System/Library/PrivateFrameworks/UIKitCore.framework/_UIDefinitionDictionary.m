@implementation _UIDefinitionDictionary

- (_UIDefinitionDictionary)initWithAsset:(id)a3
{
  id v5;
  _UIDefinitionDictionary *v6;
  _UIDefinitionDictionary *v7;
  void *v8;
  uint64_t v9;
  NSString *definitionLanguage;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDefinitionDictionary;
  v6 = -[_UIDefinitionDictionary init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawAsset, a3);
    -[MAAsset attributes](v7->_rawAsset, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Language"));
    v9 = objc_claimAutoreleasedReturnValue();
    definitionLanguage = v7->_definitionLanguage;
    v7->_definitionLanguage = (NSString *)v9;

    -[_UIDefinitionDictionary updateAsset](v7, "updateAsset");
  }

  return v7;
}

- (void)updateAsset
{
  MAAsset *assetToUpgrade;
  MAAsset *v4;
  __DCSDictionary *dictionary;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  assetToUpgrade = self->_assetToUpgrade;
  if (assetToUpgrade)
  {
    objc_storeStrong((id *)&self->_rawAsset, assetToUpgrade);
    v4 = self->_assetToUpgrade;
    self->_assetToUpgrade = 0;

  }
  if (-[_UIDefinitionDictionary assetIsLocal](self, "assetIsLocal"))
  {
    dictionary = self->_dictionary;
    if (dictionary)
      CFRelease(dictionary);
    -[MAAsset attributes](self->_rawAsset, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MAAsset getLocalFileUrl](self->_rawAsset, "getLocalFileUrl");
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v8 = getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr;
    v15 = getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr;
    if (!getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr)
    {
      v9 = DictionaryServicesLibrary_0();
      v8 = dlsym(v9, "DCSDictionaryCreateWithAssetAttributes");
      v13[3] = (uint64_t)v8;
      getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v12, 8);
    if (v8)
    {
      self->_dictionary = (__DCSDictionary *)((uint64_t (*)(void *, uint64_t))v8)(v6, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DCSDictionaryRef _DCSDictionaryCreateWithAssetAttributes(CFDictionaryRef, CFURLRef)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_UIDictionaryManager.m"), 30, CFSTR("%s"), dlerror());

      __break(1u);
    }
  }
}

- (BOOL)assetIsLocal
{
  return -[MAAsset wasLocal](self->_rawAsset, "wasLocal");
}

- (BOOL)assetIsDeletable
{
  return -[MAAsset wasPurgeable](self->_rawAsset, "wasPurgeable");
}

- (void)dealloc
{
  __DCSDictionary *dictionary;
  objc_super v4;

  dictionary = self->_dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_dictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIDefinitionDictionary;
  -[_UIDefinitionDictionary dealloc](&v4, sel_dealloc);
}

- (NSString)localizedLanguageName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[_UIDefinitionDictionary _isTTYDictionary](self, "_isTTYDictionary"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("TTY Dictionary"), CFSTR("TTY Dictionary"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MAAsset attributes](self->_rawAsset, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("IndexLanguages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_class();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_normalizedLanguageStringForLanguageCode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 1)
    {
      v9 = v8;
    }
    else if (objc_msgSend(v5, "count") == 2)
    {
      v10 = (void *)objc_opt_class();
      objc_msgSend(v5, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_normalizedLanguageStringForLanguageCode:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v8, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    v3 = v9;

  }
  return (NSString *)v3;
}

- (NSString)localizedDictionaryName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[MAAsset attributes](self->_rawAsset, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DictionaryPackageDisplayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("DictionaryPackageName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C997E0];
    objc_msgSend(v2, "objectForKey:", CFSTR("Language"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayNameForKey:value:", v7, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

+ (id)_normalizedLanguageStringForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  _DWORD v13[2];
  _QWORD v14[65];

  v14[64] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", CFSTR("en-US")))
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("American English"), CFSTR("American English"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (qword_1ECD7D480 != -1)
        dispatch_once(&qword_1ECD7D480, &__block_literal_global_134);
      v13[1] = 0;
      v7 = objc_retainAutorelease(v3);
      objc_msgSend(v7, "UTF8String");
      v8 = uldn_localeDisplayName();
      v9 = v8;
      if ((int)v8 >= 257)
      {
        MEMORY[0x1E0C80A78](v8);
        v11 = (char *)v13 - v10;
        objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
        uldn_localeDisplayName();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v11, v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v14, (int)v8);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
LABEL_11:

    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __DCSDictionary *dictionary;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL result;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 0xFA)
    v6 = 250;
  else
    v6 = v5;
  objc_msgSend(v4, "substringToIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  dictionary = self->_dictionary;
  if (!dictionary)
    goto LABEL_9;
  v10 = objc_msgSend(v7, "length");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = getDCSHasDefinitionForTermSymbolLoc_ptr;
  v19 = getDCSHasDefinitionForTermSymbolLoc_ptr;
  if (!getDCSHasDefinitionForTermSymbolLoc_ptr)
  {
    v12 = DictionaryServicesLibrary_0();
    v11 = dlsym(v12, "DCSHasDefinitionForTerm");
    v17[3] = (uint64_t)v11;
    getDCSHasDefinitionForTermSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v16, 8);
  if (v11)
  {
    LOBYTE(dictionary) = ((unsigned int (*)(__DCSDictionary *, void *, _QWORD, uint64_t, uint64_t, _QWORD))v11)(dictionary, v8, 0, v10, 2, 0) != 0;
LABEL_9:

    return (char)dictionary;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean _DCSHasDefinitionForTerm(DCSDictionaryRef, CFStringRef, CFRange, DCSTransformStyle, DCSDictionaryRef *)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_UIDictionaryManager.m"), 31, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)_HTMLDefinitionForTerm:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  __DCSDictionary *dictionary;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id result;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = v6;
  if (!self->_dictionary)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 0xFA)
    v9 = 250;
  else
    v9 = v8;
  objc_msgSend(v7, "substringToIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dictionary = self->_dictionary;
  v12 = objc_msgSend(v10, "length");
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v13 = getDCSCopyDefinitionMarkupSymbolLoc_ptr;
  v22 = getDCSCopyDefinitionMarkupSymbolLoc_ptr;
  if (!getDCSCopyDefinitionMarkupSymbolLoc_ptr)
  {
    v14 = DictionaryServicesLibrary_0();
    v13 = dlsym(v14, "DCSCopyDefinitionMarkup");
    v20[3] = (uint64_t)v13;
    getDCSCopyDefinitionMarkupSymbolLoc_ptr = v13;
  }
  _Block_object_dispose(&v19, 8);
  if (v13)
  {
    v15 = (void *)((uint64_t (*)(__DCSDictionary *, void *, _QWORD, uint64_t, int64_t, _QWORD))v13)(dictionary, v10, 0, v12, a4, 0);

LABEL_10:
    return v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _DCSCopyDefinitionMarkup(DCSDictionaryRef, CFStringRef, CFRange, DCSTransformStyle, CFURLRef *)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_UIDictionaryManager.m"), 32, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)_shortHTMLDefinitionForTerm:(id)a3
{
  return -[_UIDefinitionDictionary _HTMLDefinitionForTerm:type:](self, "_HTMLDefinitionForTerm:type:", a3, 2);
}

- (id)_fullHTMLDefinitionForTerm:(id)a3
{
  return -[_UIDefinitionDictionary _HTMLDefinitionForTerm:type:](self, "_HTMLDefinitionForTerm:type:", a3, 1);
}

- (id)_attributedDefinitionForTerm:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UIDefinitionDictionary _shortHTMLDefinitionForTerm:](self, "_shortHTMLDefinitionForTerm:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc((Class)&sel_sendScrollEventIfNecessary[16]), "initWithData:options:", v4, 0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_definitionValueForTerm:(id)a3
{
  id v4;
  _UIDefinitionValue *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIDefinitionValue *v9;

  v4 = a3;
  v5 = [_UIDefinitionValue alloc];
  -[_UIDefinitionDictionary localizedDictionaryName](self, "localizedDictionaryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDefinitionDictionary _attributedDefinitionForTerm:](self, "_attributedDefinitionForTerm:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDefinitionDictionary _fullHTMLDefinitionForTerm:](self, "_fullHTMLDefinitionForTerm:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIDefinitionValue initWithLocalizedDictionaryName:term:definition:longDefinition:](v5, "initWithLocalizedDictionaryName:term:definition:longDefinition:", v6, v4, v7, v8);

  -[_UIDefinitionValue setRawAsset:](v9, "setRawAsset:", self->_rawAsset);
  return v9;
}

- (BOOL)_isTTYDictionary
{
  void *v2;
  void *v3;
  char v4;

  -[MAAsset attributes](self->_rawAsset, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DictionaryPackageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TTY Abbreviations Dictionary.dictionary"));

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDefinitionDictionary localizedDictionaryName](self, "localizedDictionaryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIDefinitionDictionary activated](self, "activated");
  v8 = CFSTR("inactive");
  if (v7)
    v8 = CFSTR("active");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p>: Dictionary name: %@ (%@), Asset: %@"), v5, self, v6, v8, self->_rawAsset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MAAsset)rawAsset
{
  return (MAAsset *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)definitionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (MAAsset)assetToUpgrade
{
  return (MAAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetToUpgrade:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetToUpgrade, 0);
  objc_storeStrong((id *)&self->_definitionLanguage, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
}

@end
