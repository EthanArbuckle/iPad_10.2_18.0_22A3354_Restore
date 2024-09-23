@implementation _WBSParsecArraySchema

- (_WBSParsecArraySchema)initWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  uint64_t v11;
  _WBSParsecArraySchema *v12;
  _WBSParsecArraySchema *v13;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)_WBSParsecArraySchema;
  v12 = -[WBSParsecSchema _initWithExpectedClass:associatedError:isOptional:](&v15, sel__initWithExpectedClass_associatedError_isOptional_, v11, v10, v5);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_elementSchema, a3);
    v13 = v12;
  }

  return v12;
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t i;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)_WBSParsecArraySchema;
  if (-[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:](&v32, sel__validateChild_ofParent_withParentAssociatedError_errorHandler_, v10, v11, v12, v13))
  {
    -[WBSParsecSchema associatedError](self, "associatedError");
    v14 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v14;
    v26 = v12;
    if (v14)
      v15 = (void *)v14;
    else
      v15 = v12;
    v16 = v15;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v10;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      v21 = 1;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          if (!-[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:](self->_elementSchema, "_validateChild:ofParent:withParentAssociatedError:errorHandler:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v17, v16, v13))
          {
            v23 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349312;
              v34 = v17;
              v35 = 2050;
              v36 = v11;
              _os_log_error_impl(&dword_1A3D90000, v23, OS_LOG_TYPE_ERROR, "Array element schema validation failed on child %{public}p of parent %{public}p", buf, 0x16u);
            }
            v21 = 0;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v19);
    }
    else
    {
      v21 = 1;
    }

    v12 = v26;
    v10 = v27;
  }
  else
  {
    v21 = 0;
  }

  return v21 & 1;
}

- (WBSParsecSchema)elementSchema
{
  return self->_elementSchema;
}

- (void)setElementSchema:(id)a3
{
  objc_storeStrong((id *)&self->_elementSchema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementSchema, 0);
}

@end
