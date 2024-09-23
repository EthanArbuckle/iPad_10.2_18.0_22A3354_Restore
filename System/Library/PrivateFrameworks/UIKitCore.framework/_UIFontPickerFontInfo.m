@implementation _UIFontPickerFontInfo

+ (id)infoWithName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(off_1E167A828, "familyNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFamilyName:", v4);
  }
  else
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "fontWithName:size:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc((Class)a1);
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v8, "fontDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithFontDescriptor:", v11);

    }
    else
    {
      v7 = (void *)objc_msgSend(v9, "initWithFamilyName:", v4);
    }

  }
  return v7;
}

+ (id)infoWithFamilyName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFamilyName:", v4);

  return v5;
}

- (_UIFontPickerFontInfo)initWithFamilyName:(id)a3
{
  id v5;
  _UIFontPickerFontInfo *v6;
  _UIFontPickerFontInfo *v7;
  NSString *familyName;
  void *v9;
  uint64_t v10;
  UIFontDescriptor *fontDescriptor;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[_UIFontPickerFontInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyName, a3);
    familyName = v7->_familyName;
    v16 = *(_QWORD *)off_1E167DBE0;
    v17[0] = familyName;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    fontDescriptor = v7->_fontDescriptor;
    v7->_fontDescriptor = (UIFontDescriptor *)v10;

    v12 = v7->_familyName;
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isSystemFont = -[NSString isEqualToString:](v12, "isEqualToString:", v14);

  }
  return v7;
}

+ (id)initWithSystemDefaultFont
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSystemDefaultFont");
}

- (_UIFontPickerFontInfo)initWithSystemDefaultFont
{
  _UIFontPickerFontInfo *v2;
  uint64_t v3;
  UIFontDescriptor *fontDescriptor;
  uint64_t v5;
  NSString *familyName;

  v2 = -[_UIFontPickerFontInfo init](self, "init");
  if (v2)
  {
    objc_msgSend(off_1E167A830, "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0CA82A0]);
    v3 = objc_claimAutoreleasedReturnValue();
    fontDescriptor = v2->_fontDescriptor;
    v2->_fontDescriptor = (UIFontDescriptor *)v3;

    -[UIFontDescriptor objectForKey:](v2->_fontDescriptor, "objectForKey:", *(_QWORD *)off_1E167DBE0);
    v5 = objc_claimAutoreleasedReturnValue();
    familyName = v2->_familyName;
    v2->_familyName = (NSString *)v5;

    v2->_isSystemFont = 1;
  }
  return v2;
}

+ (id)infoWithFontDescriptor:(__CTFontDescriptor *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFontDescriptor:", a3);

  return v4;
}

- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3
{
  id v5;
  _UIFontPickerFontInfo *v6;
  uint64_t v7;
  NSString *familyName;
  uint64_t v9;
  NSString *styleName;
  uint64_t v11;
  NSString *fontName;
  NSString *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = -[_UIFontPickerFontInfo init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)off_1E167DBE0);
    v7 = objc_claimAutoreleasedReturnValue();
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v7;

    objc_msgSend(v5, "objectForKey:", *(_QWORD *)off_1E167DBD8);
    v9 = objc_claimAutoreleasedReturnValue();
    styleName = v6->_styleName;
    v6->_styleName = (NSString *)v9;

    objc_msgSend(v5, "objectForKey:", *(_QWORD *)off_1E167DBF0);
    v11 = objc_claimAutoreleasedReturnValue();
    fontName = v6->_fontName;
    v6->_fontName = (NSString *)v11;

    objc_storeStrong((id *)&v6->_fontDescriptor, a3);
    v13 = v6->_familyName;
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "familyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isSystemFont = -[NSString isEqualToString:](v13, "isEqualToString:", v15);

  }
  return v6;
}

- (_UIFontPickerFontInfo)initWithFontDescriptor:(id)a3 isSystemFont:(BOOL)a4
{
  _UIFontPickerFontInfo *result;

  result = -[_UIFontPickerFontInfo initWithFontDescriptor:](self, "initWithFontDescriptor:", a3);
  if (result)
    result->_isSystemFont = a4;
  return result;
}

- (BOOL)isSystemFont
{
  return self->_isSystemFont;
}

- (BOOL)hasMultipleFaces
{
  return !self->_styleName && -[_UIFontPickerFontInfo _hasMultipleFacesForFamily](self, "_hasMultipleFacesForFamily");
}

- (BOOL)_hasMultipleFacesForFamily
{
  unint64_t hasMultipleFaces;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  hasMultipleFaces = self->_hasMultipleFaces;
  if (!hasMultipleFaces)
  {
    objc_msgSend(off_1E167A828, "fontNamesForFamilyName:", self->_familyName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = 1;
    if (v5 > 1)
      v6 = 2;
    self->_hasMultipleFaces = v6;

    hasMultipleFaces = self->_hasMultipleFaces;
  }
  return hasMultipleFaces > 1;
}

- (void)setHasMultipleFaces:(BOOL)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3)
    v3 = 2;
  self->_hasMultipleFaces = v3;
}

- (id)_sortedFacesByWeight
{
  NSString *familyName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _UIFontPickerFontInfo *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  familyName = self->_familyName;
  v15 = *(_QWORD *)off_1E167DBE0;
  v16[0] = familyName;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "matchingFontDescriptorsWithMandatoryKeys:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_536);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke_2;
  v12[3] = &unk_1E16E42C8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v10 = v9;

  return v10;
}

- (NSArray)faces
{
  NSArray *v2;
  NSArray *subInfos;
  NSArray *v5;
  NSArray *v6;

  if (self->_styleName)
  {
    v2 = 0;
  }
  else
  {
    subInfos = self->_subInfos;
    if (!subInfos)
    {
      -[_UIFontPickerFontInfo _sortedFacesByWeight](self, "_sortedFacesByWeight");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_subInfos;
      self->_subInfos = v5;

      subInfos = self->_subInfos;
    }
    v2 = subInfos;
  }
  return v2;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (NSString)postscriptName
{
  void *v2;
  void *v3;

  -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postscriptName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFontFamilyAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIFontPickerFontInfo familyName](self, "familyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontNamesForFamilyName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSString)preferredShortPreviewString
{
  NSString *preferredShortPreviewString;
  NSString **p_preferredShortPreviewString;
  NSString *v4;
  void *v5;
  void *v6;

  p_preferredShortPreviewString = &self->_preferredShortPreviewString;
  preferredShortPreviewString = self->_preferredShortPreviewString;
  if (preferredShortPreviewString)
  {
    v4 = preferredShortPreviewString;
  }
  else
  {
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", self->_fontDescriptor, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSString *)CTFontCopySampleStringWithLanguages();
    objc_storeStrong((id *)p_preferredShortPreviewString, v4);

  }
  return v4;
}

- (UIImage)previewImage
{
  -[_UIFontPickerFontInfo _updatePreviewImageIfNeeded](self, "_updatePreviewImageIfNeeded");
  return self->_previewImage;
}

- (void)_updatePreviewImageIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  NSString *v6;
  NSString *previewImageContentSize;
  double v8;
  BOOL v9;
  void *v10;
  int previewImageUsesSingleCharacter;
  int v12;
  void *v13;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  if (self->_previewImage)
  {
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", self->_previewImageContentSize)
      && (objc_msgSend(v13, "displayScale"), v5 == self->_previewImageDisplayScale))
    {
      previewImageUsesSingleCharacter = self->_previewImageUsesSingleCharacter;
      v12 = -[_UIFontPickerFontInfo previewImagePrefersSingleCharacter](self, "previewImagePrefersSingleCharacter");

      v10 = v13;
      if (previewImageUsesSingleCharacter == v12)
        goto LABEL_6;
    }
    else
    {

    }
  }
  -[_UIFontPickerFontInfo _createPreviewImage:](self, "_createPreviewImage:", v13);
  objc_msgSend(v13, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  previewImageContentSize = self->_previewImageContentSize;
  self->_previewImageContentSize = v6;

  objc_msgSend(v13, "displayScale");
  self->_previewImageDisplayScale = v8;
  v9 = -[_UIFontPickerFontInfo previewImagePrefersSingleCharacter](self, "previewImagePrefersSingleCharacter");
  v10 = v13;
  self->_previewImageUsesSingleCharacter = v9;
LABEL_6:

}

- (void)_createPreviewImage:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  UIGraphicsImageRenderer *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  UIImage *v39;
  UIImage *previewImage;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  _UIFontPickerFontInfo *v47;
  id v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = v5;
  -[_UIFontPickerFontInfo preferredShortPreviewString](self, "preferredShortPreviewString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lineHeight");
  v9 = v8;
  -[_UIFontPickerFontInfo preferredShortPreviewString](self, "preferredShortPreviewString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_UIFontPickerFontInfo previewImagePrefersSingleCharacter](self, "previewImagePrefersSingleCharacter");
  objc_msgSend(v4, "lineHeight");
  v13 = v12;
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", self->_fontDescriptor, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIFontPickerFontInfo previewImagePrefersSingleCharacter](self, "previewImagePrefersSingleCharacter")
    && (-[_UIFontPickerFontInfo preferredShortPreviewString](self, "preferredShortPreviewString"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "length"),
        v15,
        v16 >= 2))
  {
    -[_UIFontPickerFontInfo preferredShortPreviewString](self, "preferredShortPreviewString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringToIndex:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UIFontPickerFontInfo preferredShortPreviewString](self, "preferredShortPreviewString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = 5.0;
  if (!v7)
    v19 = 12.0;
  v20 = 0.1;
  if (!v10)
    v20 = 0.25;
  v21 = floor(v9 * v20);
  if (v19 >= v21)
    v22 = v19;
  else
    v22 = v21;
  v23 = v13 + v22 + v22;
  v24 = 2.0;
  if (v11)
    v24 = 1.5;
  v25 = v6 * v24;
  v26 = objc_alloc(MEMORY[0x1E0CB3498]);
  v54 = *(_QWORD *)off_1E1678D90;
  v55[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v18, v27);

  objc_msgSend(v28, "size");
  v30 = v29;
  v32 = v31;
  v33 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v25, v23);
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __45___UIFontPickerFontInfo__createPreviewImage___block_invoke;
  v44 = &unk_1E16E42F0;
  v45 = v4;
  v46 = v14;
  v49 = v22;
  v50 = v30;
  v51 = v32;
  v52 = v25;
  v53 = v23;
  v47 = self;
  v48 = v28;
  v34 = v28;
  v35 = v14;
  v36 = v4;
  -[UIGraphicsImageRenderer imageWithActions:](v33, "imageWithActions:", &v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((CTFontDescriptorGetSymbolicTraits() & 0x2000) != 0)
    v38 = 1;
  else
    v38 = 2;
  objc_msgSend(v37, "imageWithRenderingMode:", v38, v41, v42, v43, v44);
  v39 = (UIImage *)objc_claimAutoreleasedReturnValue();
  previewImage = self->_previewImage;
  self->_previewImage = v39;

}

- (void)_populateLocalizedNamesIfNecessary
{
  NSString *v3;
  NSString *localizedStyleName;
  NSString *v5;
  NSString *localizedFullName;
  NSString *v7;
  NSString *localizedFamilyName;

  if (!self->_localizedFamilyName)
  {
    if (self->_styleName)
    {
      v3 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E0CA83F0], 0);
      localizedStyleName = self->_localizedStyleName;
      self->_localizedStyleName = v3;

      v5 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E0CA82D0], 0);
      localizedFullName = self->_localizedFullName;
      self->_localizedFullName = v5;

    }
    v7 = (NSString *)CTFontDescriptorCopyLocalizedAttribute((CTFontDescriptorRef)self->_fontDescriptor, (CFStringRef)*MEMORY[0x1E0CA8300], 0);
    localizedFamilyName = self->_localizedFamilyName;
    self->_localizedFamilyName = v7;

  }
}

- (NSString)localizedName
{
  NSString *localizedStyleName;

  -[_UIFontPickerFontInfo _populateLocalizedNamesIfNecessary](self, "_populateLocalizedNamesIfNecessary");
  localizedStyleName = self->_localizedStyleName;
  if (!localizedStyleName)
    localizedStyleName = self->_localizedFamilyName;
  return localizedStyleName;
}

- (NSString)localizedFullName
{
  NSString **p_localizedFullName;

  -[_UIFontPickerFontInfo _populateLocalizedNamesIfNecessary](self, "_populateLocalizedNamesIfNecessary");
  p_localizedFullName = &self->_localizedFullName;
  if (!self->_localizedFullName
    || !-[_UIFontPickerFontInfo _hasMultipleFacesForFamily](self, "_hasMultipleFacesForFamily"))
  {
    p_localizedFullName = &self->_localizedFamilyName;
  }
  return *p_localizedFullName;
}

- (BOOL)fontCanRenderLocalizedName
{
  NSNumber *canRenderName;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CTLine *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSNumber *v14;
  NSNumber *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  canRenderName = self->_canRenderName;
  if (!canRenderName)
  {
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", self->_fontDescriptor, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIFontPickerFontInfo localizedName](self, "localizedName");
    v22 = *MEMORY[0x1E0CA8188];
    v23[0] = v4;
    v6 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const __CTLine *)CTLineCreateWithString();
    CTLineGetGlyphRuns(v8);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          if ((void *)CTRunGetFont() != v4)
          {
            v6 = 0;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
      v6 = 1;
    }
LABEL_12:

    objc_msgSend(v5, "numberWithBool:", v6, v17);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v15 = self->_canRenderName;
    self->_canRenderName = v14;

    canRenderName = self->_canRenderName;
  }
  return -[NSNumber BOOLValue](canRenderName, "BOOLValue");
}

- (NSString)localizedFamilyName
{
  -[_UIFontPickerFontInfo _populateLocalizedNamesIfNecessary](self, "_populateLocalizedNamesIfNecessary");
  return self->_localizedFamilyName;
}

- (id)displayNameForFont:(id)a3
{
  const __CTFont *v4;
  const __CTFont *v5;
  CFStringRef *v6;
  void *v7;
  void *v8;

  v4 = (const __CTFont *)a3;
  v5 = v4;
  if (self->_styleName)
  {
    v6 = (CFStringRef *)MEMORY[0x1E0CA83F8];
  }
  else
  {
    if (self->_isSystemFont)
    {
      _UIKitBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_DEFAULT_FONT_NAME"), CFSTR("Default Font"), CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v6 = (CFStringRef *)MEMORY[0x1E0CA8308];
  }
  v7 = (void *)CTFontCopyLocalizedName(v4, *v6, 0);
LABEL_6:

  return v7;
}

- (id)_fontStringForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "defaultFontSize");
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledFontForFont:compatibleWithTraitCollection:", v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_msgSend(v6, "lineHeight");
  self->_lineHeight = v9;
  -[_UIFontPickerFontInfo displayNameForFont:](self, "displayNameForFont:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v15 = *(_QWORD *)off_1E1678D90;
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);

  return v13;
}

- (void)_updateAttributedStringIfNeeded
{
  void *v3;
  char v4;
  NSAttributedString *v5;
  NSAttributedString *attributedString;
  NSString *v7;
  NSString *attributedStringContentSize;
  id v9;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_attributedString
    || (objc_msgSend(v9, "preferredContentSizeCategory"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", self->_attributedStringContentSize),
        v3,
        (v4 & 1) == 0))
  {
    -[_UIFontPickerFontInfo _fontStringForTraitCollection:](self, "_fontStringForTraitCollection:", v9);
    v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    attributedString = self->_attributedString;
    self->_attributedString = v5;

    objc_msgSend(v9, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    attributedStringContentSize = self->_attributedStringContentSize;
    self->_attributedStringContentSize = v7;

  }
}

- (NSAttributedString)attributedString
{
  -[_UIFontPickerFontInfo _updateAttributedStringIfNeeded](self, "_updateAttributedStringIfNeeded");
  return self->_attributedString;
}

- (BOOL)passesLanguageFilter:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CFStringRef *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (!self->_isSystemFont
    && ((objc_msgSend(v4, "_swiftPredicate"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7)
     || (objc_msgSend(v5, "_allowedLanguages"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "count"),
         v8,
         v9)))
  {
    v10 = (CFStringRef *)MEMORY[0x1E0CA82C8];
    if (!v7)
      v10 = (CFStringRef *)MEMORY[0x1E0CA8360];
    v11 = (void *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)self->_fontDescriptor, *v10);
    v6 = objc_msgSend(v5, "_matchesLanguageList:", v11);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)matchesTraits:(unsigned int)a3
{
  return !a3 || (-[UIFontDescriptor symbolicTraits](self->_fontDescriptor, "symbolicTraits") & a3) != 0;
}

- (BOOL)matchesFamilyName:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (v4 && !-[NSString isEqualToString:](self->_familyName, "isEqualToString:", v4))
  {
    -[UIFontDescriptor objectForKey:](self->_fontDescriptor, "objectForKey:", *(_QWORD *)off_1E167DBE0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)matchesClientFontContext:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id FontPickerClientFontContextClass;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (getFontPickerClientFontContextClass())
  {
    objc_msgSend(v4, "_clientFontContextEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 1;
    if (v5)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 1;
      FontPickerClientFontContextClass = getFontPickerClientFontContextClass();
      objc_msgSend(v4, "_clientFontContextEndpoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(FontPickerClientFontContextClass, "sharedInstanceForEndpoint:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50___UIFontPickerFontInfo_matchesClientFontContext___block_invoke;
      v11[3] = &unk_1E16E4318;
      v11[4] = self;
      v11[5] = &v12;
      objc_msgSend(v9, "runBlockInClientFontContext:", v11);
      v6 = *((_BYTE *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)matchesConfiguration:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[_UIFontPickerFontInfo matchesTraits:](self, "matchesTraits:", objc_msgSend(v4, "filteredTraits"))
    && -[_UIFontPickerFontInfo passesLanguageFilter:](self, "passesLanguageFilter:", v4))
  {
    objc_msgSend(v4, "_filterFamilyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIFontPickerFontInfo matchesFamilyName:](self, "matchesFamilyName:", v5))
      v6 = -[_UIFontPickerFontInfo matchesClientFontContext:](self, "matchesClientFontContext:", v4);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)lineHeight
{
  -[_UIFontPickerFontInfo _updateAttributedStringIfNeeded](self, "_updateAttributedStringIfNeeded");
  return self->_lineHeight;
}

- (_UIFontPickerFontInfo)familyInfo
{
  _UIFontPickerFontInfo *v2;

  if (self->_styleName)
    v2 = -[_UIFontPickerFontInfo initWithFamilyName:]([_UIFontPickerFontInfo alloc], "initWithFamilyName:", self->_familyName);
  else
    v2 = self;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  _UIFontPickerFontInfo *v4;
  _UIFontPickerFontInfo *v5;
  BOOL v6;
  char v7;
  NSString *styleName;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = (_UIFontPickerFontInfo *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqualToString:](self->_familyName, "isEqualToString:", v5->_familyName))
      {
        v6 = 0;
      }
      else if (self->_familyName)
      {
        v6 = 1;
      }
      else
      {
        v6 = v5->_familyName != 0;
      }
      styleName = self->_styleName;
      if ((unint64_t)styleName | (unint64_t)v5->_styleName)
        v9 = !-[NSString isEqualToString:](styleName, "isEqualToString:");
      else
        LOBYTE(v9) = 0;
      -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[_UIFontPickerFontInfo fontDescriptor](v5, "fontDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postscriptName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFontPickerFontInfo fontDescriptor](v5, "fontDescriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "postscriptName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v13 == v15;

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

      v7 = (v6 | v9) ^ 1 | v16;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_familyName, "hash");
  return -[NSString hash](self->_styleName, "hash") ^ v3;
}

- (BOOL)matchesFamilyForFontDescriptor:(id)a3
{
  void *v4;
  NSString *familyName;
  BOOL v6;

  objc_msgSend(a3, "objectForKey:", *(_QWORD *)off_1E167DBE0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 && (familyName = self->_familyName) != 0 && -[NSString isEqualToString:](familyName, "isEqualToString:", v4);

  return v6;
}

- (BOOL)matchesFontDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postscriptName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postscriptName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v4;
}

- (id)faceMatchingDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIFontPickerFontInfo hasMultipleFaces](self, "hasMultipleFaces")
    && -[_UIFontPickerFontInfo matchesFamilyForFontDescriptor:](self, "matchesFamilyForFontDescriptor:", v4))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIFontPickerFontInfo faces](self, "faces", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "matchesFontDescriptor:", v4) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_14;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)matchesSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIFontPickerFontInfo localizedFullName](self, "localizedFullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[_UIFontPickerFontInfo styleName](self, "styleName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_UIFontPickerFontInfo styleName](self, "styleName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "localizedCaseInsensitiveContainsString:", v4);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)description
{
  void *v2;
  NSString *familyName;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  familyName = self->_familyName;
  -[_UIFontPickerFontInfo fontDescriptor](self, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postscriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), familyName, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)styleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)fontName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)previewImagePrefersSingleCharacter
{
  return self->_previewImagePrefersSingleCharacter;
}

- (void)setPreviewImagePrefersSingleCharacter:(BOOL)a3
{
  self->_previewImagePrefersSingleCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canRenderName, 0);
  objc_storeStrong((id *)&self->_subInfos, 0);
  objc_storeStrong((id *)&self->_previewImageContentSize, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_previewStringContainsArabic, 0);
  objc_storeStrong((id *)&self->_preferredShortPreviewString, 0);
  objc_storeStrong((id *)&self->_attributedStringContentSize, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_localizedStyleName, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_styleName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
