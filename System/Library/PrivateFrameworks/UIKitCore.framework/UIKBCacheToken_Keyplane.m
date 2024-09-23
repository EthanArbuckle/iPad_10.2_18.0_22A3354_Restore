@implementation UIKBCacheToken_Keyplane

- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4
{
  char v4;
  _DWORD *v6;
  _QWORD *v7;
  NSSet *transformationIdentifiers;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSString *cachedGestureKeySetName;
  NSString *geometrySetName;
  char v15;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_style.intValue != v6[18])
    goto LABEL_8;
  transformationIdentifiers = self->super._transformationIdentifiers;
  objc_msgSend(v6, "transformationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(transformationIdentifiers) = -[NSSet isEqualToSet:](transformationIdentifiers, "isEqualToSet:", v9);

  if (!(_DWORD)transformationIdentifiers)
    goto LABEL_8;
  if ((v4 & 0x34) == 0)
  {
    if ((v4 & 3) != 0)
    {
      geometrySetName = self->_geometrySetName;
      cachedGestureKeySetName = (NSString *)v7[10];
      goto LABEL_12;
    }
LABEL_13:
    v15 = 1;
    goto LABEL_9;
  }
  if (!-[NSString isEqualToString:](self->_keySetName, "isEqualToString:", v7[11]))
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

  if (!v12)
    goto LABEL_13;
  cachedGestureKeySetName = self->_cachedGestureKeySetName;
  geometrySetName = (NSString *)v7[12];
  if (cachedGestureKeySetName)
  {
LABEL_12:
    v15 = -[NSString isEqualToString:](geometrySetName, "isEqualToString:", cachedGestureKeySetName);
    goto LABEL_9;
  }
  v15 = geometrySetName == 0;
LABEL_9:

  return v15;
}

- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__UIKBCacheToken_Keyplane_stringForSplitState_handBias___block_invoke;
  v5[3] = &unk_1E16CD8A8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithKeyplane:(id)a3 keylayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIKBCacheToken_Keyplane *v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *geometrySetName;
  uint64_t v22;
  NSString *keySetName;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *cachedGestureKeySetName;
  void *v29;
  uint64_t v30;
  NSString *locale;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)UIKBCacheToken_Keyplane;
  v9 = -[UIKBCacheToken initWithName:](&v33, sel_initWithName_, v8);

  if (v9)
  {
    objc_msgSend(v7, "frame");
    v9->_size.width = v10;
    v9->_size.height = v11;
    v12 = objc_msgSend(v6, "visualStyling");
    *(_QWORD *)&v9->_style.styling = v12;
    v9->_style.intValue = v12 & 0xFFFFFF7F;
    objc_msgSend(v7, "geometrySet:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1E16EDF20;
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    objc_msgSend(v7, "keySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    _UIKBTrimKBStarName_iOS(v17);
    v20 = objc_claimAutoreleasedReturnValue();

    geometrySetName = v9->_geometrySetName;
    v9->_geometrySetName = (NSString *)v20;

    _UIKBTrimKBStarName_iOS(v19);
    v22 = objc_claimAutoreleasedReturnValue();
    keySetName = v9->_keySetName;
    v9->_keySetName = (NSString *)v22;

    objc_msgSend(v7, "cachedGestureLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "keySet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _UIKBTrimKBStarName_iOS(v26);
    v27 = objc_claimAutoreleasedReturnValue();
    cachedGestureKeySetName = v9->_cachedGestureKeySetName;
    v9->_cachedGestureKeySetName = (NSString *)v27;

    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localeIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    locale = v9->_locale;
    v9->_locale = (NSString *)v30;

    v9->super._scale = 0.0;
  }

  return v9;
}

+ (id)tokenForKeyplane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "subtrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKeyplane:keylayout:", v3, v6);
    v4 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(_QWORD *)&self->_style.styling;
}

- (void)setStyling:(id)a3
{
  *(_QWORD *)&self->_style.styling = *(_QWORD *)&a3;
}

- (void)annotateWithBool:(BOOL)a3
{
  _BOOL4 v3;
  NSString *annotations;
  NSString *v6;
  NSString *v7;
  const __CFString *v8;
  NSString *v9;
  NSString *v10;

  v3 = a3;
  annotations = self->_annotations;
  if (!annotations)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_annotations;
    self->_annotations = v6;

    annotations = self->_annotations;
  }
  if (v3)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  -[NSString stringByAppendingString:](annotations, "stringByAppendingString:", v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_annotations;
  self->_annotations = v9;

}

- (void)annotateWithInt:(int)a3
{
  uint64_t v3;
  NSString *annotations;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v3 = *(_QWORD *)&a3;
  annotations = self->_annotations;
  if (!annotations)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_annotations;
    self->_annotations = v6;

    annotations = self->_annotations;
  }
  -[NSString stringByAppendingFormat:](annotations, "stringByAppendingFormat:", CFSTR("%d"), v3);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = self->_annotations;
  self->_annotations = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_cachedGestureKeySetName, 0);
  objc_storeStrong((id *)&self->_keySetName, 0);
  objc_storeStrong((id *)&self->_geometrySetName, 0);
}

@end
