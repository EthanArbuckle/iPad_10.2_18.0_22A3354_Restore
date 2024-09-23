@implementation PFParallaxLayerStyle

- (PFParallaxLayerStyle)initWithKind:(id)a3 parameters:(id)a4 colorSuggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  PFParallaxLayerStyle *v12;
  uint64_t v13;
  NSString *kind;
  uint64_t v15;
  NSDictionary *parameters;
  uint64_t v17;
  NSArray *colorSuggestions;
  objc_super v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  +[PFParallaxLayerStyle validateParameters:error:](PFParallaxLayerStyle, "validateParameters:error:", v9, &v21);
  v11 = v21;
  v20.receiver = self;
  v20.super_class = (Class)PFParallaxLayerStyle;
  v12 = -[PFParallaxLayerStyle init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    kind = v12->_kind;
    v12->_kind = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    parameters = v12->_parameters;
    v12->_parameters = (NSDictionary *)v15;

    v17 = objc_msgSend(v10, "copy");
    colorSuggestions = v12->_colorSuggestions;
    v12->_colorSuggestions = (NSArray *)v17;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PFParallaxLayerStyle isEqualToParallaxLayerStyle:](self, "isEqualToParallaxLayerStyle:", v4);

  return v5;
}

- (BOOL)isEqualToParallaxLayerStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[PFParallaxLayerStyle kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7
    && (-[PFParallaxLayerStyle parameters](self, "parameters"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "parameters"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToDictionary:", v9),
        v9,
        v8,
        v10))
  {
    -[PFParallaxLayerStyle colorSuggestions](self, "colorSuggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorSuggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToArray:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxLayerStyle kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStyle parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStyle colorSuggestions](self, "colorSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, kind: %@, parameters: %@, color suggestions: %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PFParallaxLayerStyle kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kind"));

  -[PFParallaxLayerStyle parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameters"));

  -[PFParallaxLayerStyle colorSuggestions](self, "colorSuggestions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("colorSuggestions"));

}

- (PFParallaxLayerStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PFParallaxLayerStyle *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v6, v9, CFSTR("parameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("colorSuggestions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PFParallaxLayerStyle initWithKind:parameters:colorSuggestions:](self, "initWithKind:parameters:colorSuggestions:", v5, v10, v11);
  return v12;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)colorSuggestions
{
  return self->_colorSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSuggestions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

+ (BOOL)styleKind:(id)a3 supportsParameter:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("mode")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("color")))
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ColorWashSingle")) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", CFSTR("ColorBGStandard")) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", CFSTR("GreenScreen")) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", CFSTR("GreenScreenMono")) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", CFSTR("GreenScreenBlur")) & 1) == 0)
      {
        v7 = CFSTR("GreenScreenGraphic");
        goto LABEL_14;
      }
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("primaryColor")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("secondaryColor")) & 1) != 0)
      {
        v7 = CFSTR("ColorWashDuotone");
        goto LABEL_14;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("clockFont")) & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("clockColor")) & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("clockVibrancy")) & 1) == 0)
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("headroomLook")))
        {
          v8 = 0;
          goto LABEL_19;
        }
        v7 = CFSTR("Original");
        goto LABEL_14;
      }
    }
LABEL_18:
    v8 = 1;
    goto LABEL_19;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Studio")) & 1) != 0)
    goto LABEL_18;
  v7 = CFSTR("BlackWhite");
LABEL_14:
  v8 = objc_msgSend(v5, "isEqualToString:", v7);
LABEL_19:

  return v8;
}

+ (BOOL)isSegmentedStyle:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Studio")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("BlackWhite")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ColorBGStandard")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("GreenScreen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("GreenScreenMono")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("GreenScreenBlur")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GreenScreenGraphic"));
  }

  return v4;
}

+ (id)dictionaryWithStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "colorSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serializeColorSuggestions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serializeParameters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("kind");
  objc_msgSend(v4, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = v8;
  v12[1] = CFSTR("parameters");
  v12[2] = CFSTR("colorSuggestions");
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)serializeColorSuggestions:(id)a3
{
  return PFMap(a3, &__block_literal_global_41_7838);
}

+ (id)serializeParameters:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PFParallaxLayerStyle_serializeParameters___block_invoke;
  v4[3] = &__block_descriptor_40_e21__24__0__NSString_8_16l;
  v4[4] = a1;
  PFMapDictionary(a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serializeParameter:(id)a3 forKey:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  v5 = serializeParameter_forKey__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&serializeParameter_forKey__onceToken, &__block_literal_global_48);
  objc_msgSend((id)serializeParameter_forKey__parameterSerializationMap, "objectForKeyedSubscript:", v6);
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id))v8)[2](v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (PFParallaxLayerStyle)styleWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  PFParallaxLayerStyle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parameters"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v25 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid style parameters: %@"), v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v12);
            v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            v10 = (uint64_t)v9;
            goto LABEL_26;
          }
LABEL_21:
          v17 = 0;
LABEL_28:

          goto LABEL_29;
        }
        objc_msgSend(a1, "deserializeParameters:error:", v9, a4);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("colorSuggestions"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
LABEL_30:
                v17 = 0;
                goto LABEL_27;
              }
              v20 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid color suggestions: %@"), v11, *MEMORY[0x1E0CB2938]);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v21);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              v17 = 0;
              goto LABEL_26;
            }
            objc_msgSend(a1, "deserializeColorSuggestions:error:", v11, a4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
              goto LABEL_30;
          }
          else
          {
            NSLog(CFSTR("Dictionary missing color suggestions. It may have been serialized by an older version."));
            v12 = (void *)MEMORY[0x1E0C9AA60];
          }
          v17 = -[PFParallaxLayerStyle initWithKind:parameters:colorSuggestions:]([PFParallaxLayerStyle alloc], "initWithKind:parameters:colorSuggestions:", v7, v10, v12);
LABEL_26:

          goto LABEL_27;
        }
      }
      else if (a4)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary missing style parameters: %@"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v12);
        v10 = 0;
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      v9 = 0;
      goto LABEL_21;
    }
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid style kind: %@"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v30 = v10;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v30;
      v16 = &v29;
      goto LABEL_14;
    }
  }
  else if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary missing a style kind: %@"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v32;
    v16 = &v31;
LABEL_14:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v11);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    v9 = (void *)v10;
    goto LABEL_28;
  }
  v17 = 0;
LABEL_29:

  return v17;
}

+ (id)deserializeParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7808;
  v20 = __Block_byref_object_dispose__7809;
  v21 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PFParallaxLayerStyle_deserializeParameters_error___block_invoke;
  v12[3] = &unk_1E45A3C80;
  v15 = a1;
  v8 = v7;
  v13 = v8;
  v14 = &v16;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)v17[5];
  if (v9)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v10 = v8;
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)deserializeParameter:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (deserializeParameter_forKey_error__onceToken != -1)
    dispatch_once(&deserializeParameter_forKey_error__onceToken, &__block_literal_global_72);
  objc_msgSend((id)deserializeParameter_forKey_error__parameterDeserializationMap, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id *))(v9 + 16))(v9, v7, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown parameter key: %@"), v8, *MEMORY[0x1E0CB2938]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

+ (id)deserializeColorSuggestions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v16 = (void *)MEMORY[0x1E0CB35C8];
            v24 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid color suggestion value: %@"), v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v18);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_13:

          v15 = 0;
          goto LABEL_14;
        }
        +[PFParallaxPaletteSuggestion paletteSuggestionWithDictionary:error:](PFParallaxPaletteSuggestion, "paletteSuggestionWithDictionary:error:", v12, a4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_13;
        v14 = (void *)v13;
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = v6;
LABEL_14:

  return v15;
}

+ (BOOL)validateParameters:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7808;
  v15 = __Block_byref_object_dispose__7809;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PFParallaxLayerStyle_validateParameters_error___block_invoke;
  v10[3] = &unk_1E45A3CE8;
  v10[5] = &v11;
  v10[6] = a1;
  v10[4] = &v17;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((_BYTE *)v18 + 24))
  {
    *a4 = objc_retainAutorelease((id)v12[5]);
    v7 = *((unsigned __int8 *)v18 + 24);
  }
  v8 = v7 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

+ (BOOL)validateParameterKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (validateParameterKey_value_error__onceToken != -1)
    dispatch_once(&validateParameterKey_value_error__onceToken, &__block_literal_global_84);
  objc_msgSend((id)validateParameterKey_value_error__parameterValidationMap, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    if (!a5)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown parameter key: %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (void **)v23;
    v17 = &v22;
LABEL_9:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v8);
  v12 = v11;
  if (a5 && (v11 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter for key: %@, value: %@"), v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_9;
  }
LABEL_11:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __57__PFParallaxLayerStyle_validateParameterKey_value_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mode");
  v2[1] = CFSTR("color");
  v3[0] = &__block_literal_global_82;
  v3[1] = &__block_literal_global_80_7806;
  v2[2] = CFSTR("primaryColor");
  v2[3] = CFSTR("secondaryColor");
  v3[2] = &__block_literal_global_80_7806;
  v3[3] = &__block_literal_global_80_7806;
  v2[4] = CFSTR("clockFont");
  v2[5] = CFSTR("clockColor");
  v3[4] = &__block_literal_global_81;
  v3[5] = &__block_literal_global_80_7806;
  v2[6] = CFSTR("clockVibrancy");
  v2[7] = CFSTR("lowKey");
  v3[6] = &__block_literal_global_82;
  v3[7] = &__block_literal_global_82;
  v2[8] = CFSTR("highKey");
  v2[9] = CFSTR("background");
  v3[8] = &__block_literal_global_82;
  v3[9] = &__block_literal_global_82;
  v2[10] = CFSTR("headroomLook");
  v3[10] = &__block_literal_global_82;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validateParameterKey_value_error__parameterValidationMap;
  validateParameterKey_value_error__parameterValidationMap = v0;

}

void __49__PFParallaxLayerStyle_validateParameters_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;
  id v8;
  id v9;
  id v10;

  v6 = (void *)a1[6];
  v10 = 0;
  v7 = objc_msgSend(v6, "validateParameterKey:value:error:", a2, a3, &v10);
  v8 = v10;
  v9 = v10;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v8);
  }

}

void __58__PFParallaxLayerStyle_deserializeParameter_forKey_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mode");
  v2[1] = CFSTR("color");
  v3[0] = &__block_literal_global_71_7814;
  v3[1] = &__block_literal_global_67;
  v2[2] = CFSTR("primaryColor");
  v2[3] = CFSTR("secondaryColor");
  v3[2] = &__block_literal_global_67;
  v3[3] = &__block_literal_global_67;
  v2[4] = CFSTR("clockFont");
  v2[5] = CFSTR("clockColor");
  v3[4] = &__block_literal_global_71_7814;
  v3[5] = &__block_literal_global_67;
  v2[6] = CFSTR("clockVibrancy");
  v2[7] = CFSTR("lowKey");
  v3[6] = &__block_literal_global_71_7814;
  v3[7] = &__block_literal_global_71_7814;
  v2[8] = CFSTR("highKey");
  v2[9] = CFSTR("background");
  v3[8] = &__block_literal_global_71_7814;
  v3[9] = &__block_literal_global_71_7814;
  v2[10] = CFSTR("headroomLook");
  v3[10] = &__block_literal_global_71_7814;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deserializeParameter_forKey_error__parameterDeserializationMap;
  deserializeParameter_forKey_error__parameterDeserializationMap = v0;

}

void __52__PFParallaxLayerStyle_deserializeParameters_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = *(void **)(a1 + 48);
  v12 = 0;
  objc_msgSend(v8, "deserializeParameter:forKey:error:", a3, v7, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  v11 = v12;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
    *a4 = 1;
  }

}

void __50__PFParallaxLayerStyle_serializeParameter_forKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mode");
  v2[1] = CFSTR("color");
  v3[0] = &__block_literal_global_47_7832;
  v3[1] = &__block_literal_global_45_7833;
  v2[2] = CFSTR("primaryColor");
  v2[3] = CFSTR("secondaryColor");
  v3[2] = &__block_literal_global_45_7833;
  v3[3] = &__block_literal_global_45_7833;
  v2[4] = CFSTR("clockFont");
  v2[5] = CFSTR("clockVibrancy");
  v3[4] = &__block_literal_global_47_7832;
  v3[5] = &__block_literal_global_47_7832;
  v2[6] = CFSTR("clockColor");
  v2[7] = CFSTR("lowKey");
  v3[6] = &__block_literal_global_45_7833;
  v3[7] = &__block_literal_global_47_7832;
  v2[8] = CFSTR("highKey");
  v2[9] = CFSTR("background");
  v3[8] = &__block_literal_global_47_7832;
  v3[9] = &__block_literal_global_47_7832;
  v2[10] = CFSTR("headroomLook");
  v3[10] = &__block_literal_global_47_7832;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serializeParameter_forKey__parameterSerializationMap;
  serializeParameter_forKey__parameterSerializationMap = v0;

}

uint64_t __44__PFParallaxLayerStyle_serializeParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "serializeParameter:forKey:", a3, a2);
}

id __50__PFParallaxLayerStyle_serializeColorSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PFParallaxPaletteSuggestion dictionaryWithPaletteSuggestion:](PFParallaxPaletteSuggestion, "dictionaryWithPaletteSuggestion:", a2);
}

@end
