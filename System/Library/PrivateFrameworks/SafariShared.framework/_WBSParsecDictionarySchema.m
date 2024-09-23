@implementation _WBSParsecDictionarySchema

- (_WBSParsecDictionarySchema)initWithSchemaDictionary:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  _WBSParsecDictionarySchema *v11;
  uint64_t v12;
  NSDictionary *keysToSchemata;
  _WBSParsecDictionarySchema *v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)_WBSParsecDictionarySchema;
  v11 = -[WBSParsecSchema _initWithExpectedClass:associatedError:isOptional:](&v16, sel__initWithExpectedClass_associatedError_isOptional_, v10, v9, v5);

  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    keysToSchemata = v11->_keysToSchemata;
    v11->_keysToSchemata = (NSDictionary *)v12;

    v14 = v11;
  }

  return v11;
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSDictionary *keysToSchemata;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_WBSParsecDictionarySchema;
  if (-[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:](&v31, sel__validateChild_ofParent_withParentAssociatedError_errorHandler_, v10, v11, v12, v13))
  {
    if (v10 || !-[WBSParsecSchema isOptional](self, "isOptional"))
    {
      -[WBSParsecSchema associatedError](self, "associatedError");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (void *)v15;
      else
        v17 = v12;
      v18 = v17;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 1;
      keysToSchemata = self->_keysToSchemata;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke;
      v22[3] = &unk_1E4B3DA40;
      v23 = v10;
      v20 = v18;
      v24 = v20;
      v25 = v13;
      v26 = &v27;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](keysToSchemata, "enumerateKeysAndObjectsUsingBlock:", v22);
      v14 = *((_BYTE *)v28 + 24) != 0;

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)keysToSchemata
{
  return self->_keysToSchemata;
}

- (void)setKeysToSchemata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToSchemata, 0);
}

@end
