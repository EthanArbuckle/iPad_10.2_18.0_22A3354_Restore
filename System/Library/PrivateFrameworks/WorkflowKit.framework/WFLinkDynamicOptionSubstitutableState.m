@implementation WFLinkDynamicOptionSubstitutableState

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *localizedTitle;

  if (!-[NSString length](self->_localizedTitle, "length"))
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wf_localizedString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v5;

  }
  return self->_localizedTitle;
}

- (WFLinkDynamicOptionSubstitutableState)initWithValue:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 image:(id)a6
{
  id v10;
  id v11;
  id v12;
  WFLinkDynamicOptionSubstitutableState *v13;
  uint64_t v14;
  NSString *localizedTitle;
  uint64_t v16;
  NSString *localizedSubtitle;
  uint64_t v18;
  WFImage *image;
  WFLinkDynamicOptionSubstitutableState *v20;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
  v13 = -[WFVariableSubstitutableParameterState initWithValue:](&v22, sel_initWithValue_, a3);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    localizedTitle = v13->_localizedTitle;
    v13->_localizedTitle = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    localizedSubtitle = v13->_localizedSubtitle;
    v13->_localizedSubtitle = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    image = v13->_image;
    v13->_image = (WFImage *)v18;

    v20 = v13;
  }

  return v13;
}

- (NSString)localizedSubtitle
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *localizedSubtitle;

  if (!-[NSString length](self->_localizedSubtitle, "length"))
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wf_localizedString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedSubtitle = self->_localizedSubtitle;
    self->_localizedSubtitle = v5;

  }
  return self->_localizedSubtitle;
}

- (BOOL)valueNeedsDisplayRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFLinkDynamicOptionSubstitutableState.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[option isKindOfClass:[LNDynamicOption class]]"));

  }
  v6 = objc_msgSend(v5, "containsSensitiveContent");
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wfSerializedRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("title"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("symbol"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("image"));
  }

  return v10;
}

- (WFImage)image
{
  WFImage *image;
  void *v4;
  void *v5;
  WFImage *v6;
  WFImage *v7;

  image = self->_image;
  if (!image)
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_image");
    v6 = (WFImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }
  return image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      objc_msgSend(v8, "parameter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parameterMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "wf_objectClass");
      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v22[3] = &unk_1E7AF3348;
      v25 = v10;
      v26 = v17;
      v23 = v16;
      v24 = v14;
      v19 = v14;
      v12 = v16;
      objc_msgSend(v18, "getContentWithContext:completionHandler:", v8, v22);

    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v21, 0);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  objc_super v21;
  objc_super v22;

  v4 = a3;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsSensitiveContent") & 1) != 0)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v21.receiver = self;
    v21.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    if (-[WFVariableSubstitutableParameterState isEqual:](&v21, sel_isEqual_, v6))
    {
      objc_msgSend(v5, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v18 = v16;
      v19 = v18;
      if (v17 == v18)
      {
        v8 = 1;
      }
      else
      {
        v8 = 0;
        if (v17 && v18)
          v8 = objc_msgSend(v17, "isEqual:", v18);
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    v8 = -[WFVariableSubstitutableParameterState isEqual:](&v22, sel_isEqual_, v4);
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;
  objc_super v10;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsSensitiveContent") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    v4 = -[WFVariableSubstitutableParameterState hash](&v9, sel_hash);
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash") ^ v4;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    v7 = -[WFVariableSubstitutableParameterState hash](&v10, sel_hash);
  }

  return v7;
}

- (BOOL)stateIsEquivalent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v88;
  int v89;
  int v90;
  void *v91;

  v4 = a3;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  LOBYTE(v11) = 0;
  if (v7 && v10)
  {
    objc_msgSend(v7, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) != 0)
    {
      LOBYTE(v11) = 1;
      goto LABEL_103;
    }
    objc_msgSend(v7, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "valueType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "valueType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqual:", v20);

      if (v21)
      {
        objc_msgSend(v7, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v23, "isTransient") & 1) == 0 && (objc_msgSend(v25, "isTransient") & 1) == 0)
        {
          objc_msgSend(v23, "identifier");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            objc_msgSend(v25, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v23, "identifier");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v11) = objc_msgSend(v29, "isEqual:", v30);
              goto LABEL_100;
            }
          }
        }
        if (objc_msgSend(v23, "isTransient") && objc_msgSend(v25, "isTransient"))
        {
          objc_msgSend(v23, "properties");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "properties");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v47;
          v49 = v48;
          v30 = v49;
          if (v29 == v49)
          {

          }
          else
          {
            LOBYTE(v11) = 0;
            v50 = v49;
            v46 = v29;
            if (!v29 || !v49)
              goto LABEL_98;
            v11 = objc_msgSend(v29, "isEqualToArray:", v49);

            if (!v11)
              goto LABEL_100;
          }
          objc_msgSend(v23, "managedAccountIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "managedAccountIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v76;
          v78 = v77;
          v91 = v78;
          if (v46 != v78)
          {
            LOBYTE(v11) = 0;
            if (v46)
            {
              v79 = v78;
              v80 = v46;
              if (v78)
              {
                v11 = objc_msgSend(v46, "isEqualToString:", v78);

                if (!v11)
                  goto LABEL_97;
                goto LABEL_86;
              }
            }
            else
            {
              v79 = v78;
              v80 = 0;
            }
LABEL_96:

LABEL_97:
            v50 = v91;
LABEL_98:

            goto LABEL_99;
          }

LABEL_86:
          objc_msgSend(v23, "prototypeMangledTypeName");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "prototypeMangledTypeName");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v84;
          v86 = v85;
          v79 = v86;
          if (v80 == v86)
          {
            LOBYTE(v11) = 1;
          }
          else
          {
            LOBYTE(v11) = 0;
            if (v80 && v86)
              LOBYTE(v11) = objc_msgSend(v80, "isEqualToString:", v86);
          }

          goto LABEL_96;
        }
LABEL_54:
        LOBYTE(v11) = 0;
LABEL_102:

        goto LABEL_103;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "value");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "valueType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "valueType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "typeIdentifier") == 13)
      {
        objc_msgSend(v7, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "valueType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "valueType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v36, "isEqual:", v38);

        if (v89)
        {
          objc_msgSend(v7, "value");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "value");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = objc_msgSend(v23, "type");
          if (v41 != objc_msgSend(v25, "type"))
            goto LABEL_54;
          objc_msgSend(v23, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v42;
          v44 = v43;
          v30 = v44;
          if (v29 == v44)
          {

          }
          else
          {
            LOBYTE(v11) = 0;
            v45 = v44;
            v46 = v29;
            if (!v29 || !v44)
            {
LABEL_92:

LABEL_99:
              goto LABEL_100;
            }
            v11 = objc_msgSend(v29, "isEqualToString:", v44);

            if (!v11)
              goto LABEL_100;
          }
          objc_msgSend(v23, "identificationHint");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identificationHint");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v81;
          v83 = v82;
          v45 = v83;
          if (v46 == v83)
          {
            LOBYTE(v11) = 1;
          }
          else
          {
            LOBYTE(v11) = 0;
            if (v46 && v83)
              LOBYTE(v11) = objc_msgSend(v46, "isEqualToString:", v83);
          }

          goto LABEL_92;
        }
LABEL_41:
        objc_msgSend(v7, "value");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "valueType");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "valueType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "typeIdentifier") == 12)
          {
            objc_msgSend(v7, "value");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "valueType");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "value");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "valueType");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v88) = objc_msgSend(v55, "isEqual:", v57);

            if ((_DWORD)v88)
            {
              objc_msgSend(v7, "value");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "value");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "value");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "fileURL");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              if (v29 || (objc_msgSend(v25, "fileURL"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend(v23, "filename");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v60 || (objc_msgSend(v25, "filename"), (v88 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  objc_msgSend(v23, "fileURL");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "fileURL");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = v71;
                  v74 = v72;
                  v75 = v74;
                  if (v73 == v74)
                  {
                    LOBYTE(v11) = 1;
                  }
                  else
                  {
                    LOBYTE(v11) = 0;
                    if (v73 && v74)
                      LOBYTE(v11) = objc_msgSend(v73, "isEqual:", v74);
                  }

                  v61 = (void *)v88;
                  if (!v60)
                  {
LABEL_77:

                    if (v29)
                    {
LABEL_101:

                      goto LABEL_102;
                    }
LABEL_100:

                    goto LABEL_101;
                  }
                }
                else
                {
                  v61 = 0;
                  LOBYTE(v11) = 0;
                }

                goto LABEL_77;
              }
              v29 = 0;
LABEL_53:
              LOBYTE(v11) = 0;
              goto LABEL_100;
            }
LABEL_51:
            objc_msgSend(v7, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "valueType");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_54;
            objc_msgSend(v7, "value");
            v29 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "valueType");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v30, "typeIdentifier"))
            {
              objc_msgSend(v7, "value");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "valueType");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "value");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "valueType");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v63, "isEqual:", v65);

              if (!v90)
              {
                LOBYTE(v11) = 0;
                goto LABEL_103;
              }
              objc_msgSend(v7, "value");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "value");
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "value");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "value");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = v67;
              v70 = v69;
              if (v29 == v70)
              {
                LOBYTE(v11) = 1;
                v30 = v29;
                v25 = v29;
              }
              else
              {
                v30 = v70;
                LOBYTE(v11) = 0;
                if (v29 && v70)
                  LOBYTE(v11) = objc_msgSend(v29, "isEqualToString:", v70);
                v25 = v30;
              }
              v23 = v29;
              goto LABEL_100;
            }
            goto LABEL_53;
          }

        }
        goto LABEL_51;
      }

    }
    goto LABEL_41;
  }
LABEL_103:

  return v11;
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "wf_objectValueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v14[3] = &unk_1E7AF3320;
    v17 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 40);
    v16 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11;
    v11[3] = &unk_1E7AF8790;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 48);
    v10 = v7;
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v14, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "displayRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
  v15[3] = &unk_1E7AF32F8;
  v21 = *(_QWORD *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  v17 = v6;
  v20 = v7;
  v18 = v10;
  v19 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = v10;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v14, "getObjectRepresentations:forClass:", v15, v11);

}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (v5)
    v8 = 0;
  else
    v8 = v6;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8, v5);

}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D141B8];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D141B8]) && !objc_msgSend(v9, "code"))
  {
    v15 = *(_QWORD *)(a1 + 72);
    v16 = objc_opt_class();

    if (v15 == v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "parameterMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "wf_isPersistentFileIdentifiableEntity");

      v19 = *(void **)(a1 + 40);
      if (v18)
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
        v38[3] = &unk_1E7AF6C78;
        v39 = *(id *)(a1 + 64);
        objc_msgSend(v19, "getFileRepresentations:forType:", v38, 0);
        v14 = v39;
      }
      else
      {
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6;
        v35[3] = &unk_1E7AF3258;
        v37 = *(id *)(a1 + 64);
        v36 = v9;
        objc_msgSend(v19, "getObjectRepresentations:forClass:", v35, objc_opt_class());

        v14 = v37;
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v11) && !objc_msgSend(v9, "code"))
  {
    v20 = *(_QWORD *)(a1 + 72);
    v21 = objc_opt_class();

    if (v20 == v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "parameterMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "typeSpecificMetadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = *(void **)(a1 + 40);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8;
      v31[3] = &unk_1E7AF32A8;
      v34 = *(id *)(a1 + 64);
      v32 = v9;
      v33 = v24;
      v26 = v24;
      objc_msgSend(v25, "getObjectRepresentations:forClass:", v31, objc_opt_class());

      goto LABEL_11;
    }
  }
  else
  {

  }
  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_11;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10;
  v27[3] = &unk_1E7AF32D0;
  v28 = *(id *)(a1 + 48);
  v29 = v8;
  v30 = *(id *)(a1 + 56);
  objc_msgSend(v7, "if_map:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  v14 = v28;
LABEL_9:

LABEL_11:
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "if_map:", &__block_literal_global_39110);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_131_39108);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9;
    v5[3] = &unk_1E7AF3280;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(a2, "if_compactMap:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = *(id *)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_alloc(MEMORY[0x1E0D43DF8]);
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithKey:table:bundleURL:", v10, 0, 0);

      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C50]), "initWithTitle:subtitle:image:", v11, 0, 0);
    }
    else
    {
      v6 = 0;
    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E38]), "initWithValue:valueType:displayRepresentation:", v5, *(_QWORD *)(a1 + 48), v6);

  return v12;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D43E38];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_alloc(MEMORY[0x1E0D43D18]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEnumerationIdentifier:", v7);
  v9 = (void *)objc_msgSend(v5, "initWithValue:valueType:", v4, v8);

  return v9;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D43E38];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(MEMORY[0x1E0D43D90], "stringValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithValue:valueType:", v3, v5);

  return v6;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CBD8A8], "wf_fileWithFileRepresentation:displayName:", a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D43E38]);
  objc_msgSend(MEMORY[0x1E0D43D10], "fileValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithValue:valueType:", v2, v4);

  return v5;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return (id)objc_msgSend(a1, "valueFromSerializedRepresentation:variableProvider:parameter:bundleIdentifier:", a3, a4, a5, 0);
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 bundleIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v9;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  v15 = v11;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  objc_msgSend(v17, "parameterMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueType");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("valueType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v22 = 0;
      goto LABEL_26;
    }
    v19 = v21;

  }
  v20 = v14;
  if (!v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = 0;
    else
      v20 = v9;
  }
  objc_msgSend(MEMORY[0x1E0D43E38], "valueFromSerializedRepresentation:valueType:variableProvider:parameter:bundleIdentifier:", v20, v19, v10, v15, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v23, 0);
    objc_msgSend(v17, "dataSource");
    v30 = v9;
    v24 = v14;
    v25 = v12;
    v26 = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContainsSensitiveContent:", objc_msgSend(v27, "enumeration:shouldStripSenstitiveContentFromValue:", v17, v22));

    v10 = v26;
    v12 = v25;
    v14 = v24;
    v9 = v30;
  }
  else
  {
    getWFAppIntentsLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "+[WFLinkDynamicOptionSubstitutableState valueFromSerializedRepresentation:variableProvider:parameter:bundleIdentifier:]";
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to deserialize dynamic option value", buf, 0xCu);
    }

    v22 = 0;
  }

LABEL_26:
  return v22;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
