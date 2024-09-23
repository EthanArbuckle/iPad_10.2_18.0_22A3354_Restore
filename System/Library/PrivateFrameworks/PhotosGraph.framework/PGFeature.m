@implementation PGFeature

- (PGFeature)initWithEncodedFeature:(id)a3
{
  id v4;
  PGFeature *v5;
  void *v6;
  uint64_t v7;
  id typeSpecificIdentifier;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGFeature;
  v5 = -[PGFeature init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spec"));
    v7 = objc_claimAutoreleasedReturnValue();
    typeSpecificIdentifier = v5->_typeSpecificIdentifier;
    v5->_typeSpecificIdentifier = (id)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

  }
  return v5;
}

- (id)encodedFeature
{
  void *v3;
  void *v4;
  void *v5;
  id typeSpecificIdentifier;
  NSString *name;

  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  typeSpecificIdentifier = self->_typeSpecificIdentifier;
  if (typeSpecificIdentifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", typeSpecificIdentifier, CFSTR("spec"));
  name = self->_name;
  if (name)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", name, CFSTR("name"));
  return v5;
}

- (NSString)name
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = self->_name;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (self->_typeSpecificIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_typeSpecificIdentifier);
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", self->_type);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("No %@"), v5);
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (BOOL)isNoneFeature
{
  return !self->_typeSpecificIdentifier && self->_name == 0;
}

- (id)nodeInGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id typeSpecificIdentifier;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[6];
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  const __CFString *v52;
  id v53;
  const __CFString *v54;
  id v55;
  const __CFString *v56;
  id v57;
  const __CFString *v58;
  id v59;
  const __CFString *v60;
  id v61;
  const __CFString *v62;
  id v63;
  const __CFString *v64;
  id v65;
  const __CFString *v66;
  id v67;
  const __CFString *v68;
  id v69;
  const __CFString *v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = 0;
  switch(self->_type)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
      }
      objc_msgSend(v5, "yearNodeForYear:", objc_msgSend(self->_typeSpecificIdentifier, "integerValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 2uLL:
      goto LABEL_22;
    case 3uLL:
      objc_msgSend(v4, "meNode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", self->_typeSpecificIdentifier);

      if (v23)
      {
        v24 = v21;
      }
      else
      {
        objc_msgSend(v5, "personNodeForPersonLocalIdentifier:", self->_typeSpecificIdentifier);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v24;

      goto LABEL_49;
    case 4uLL:
      typeSpecificIdentifier = self->_typeSpecificIdentifier;
      v66 = CFSTR("id");
      v67 = typeSpecificIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("City"), 200, v26);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 5uLL:
      v27 = self->_typeSpecificIdentifier;
      v64 = CFSTR("id");
      v65 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("State"), 200, v28);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 6uLL:
      v29 = self->_typeSpecificIdentifier;
      v62 = CFSTR("name");
      v63 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("Country"), 200, v30);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 7uLL:
      +[PGGraphAddressNodeCollection addressNodeAsCollectionForUUID:inGraph:](PGGraphAddressNodeCollection, "addressNodeAsCollectionForUUID:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 8uLL:
    case 0x14uLL:
      v7 = self->_typeSpecificIdentifier;
      v60 = CFSTR("name");
      v61 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("Area"), 201, v8);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 9uLL:
      objc_msgSend(v4, "anyNodeForLabel:domain:properties:", self->_typeSpecificIdentifier, 502, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0xAuLL:
      objc_msgSend(v4, "anyNodeForLabel:domain:properties:", self->_typeSpecificIdentifier, 501, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0xBuLL:
      +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0xCuLL:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PGFeature - Collection nodes are no longer supported", buf, 2u);
      }
      goto LABEL_56;
    case 0xDuLL:
      objc_msgSend(v4, "anyNodeForLabel:domain:properties:", self->_typeSpecificIdentifier, 700, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0xEuLL:
      v31 = self->_typeSpecificIdentifier;
      v58 = CFSTR("name");
      v59 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("Season"), 400, v32);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 0xFuLL:
      v33 = self->_typeSpecificIdentifier;
      v56 = CFSTR("name");
      v57 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("Holiday"), 401, v34);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 0x10uLL:
      +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightGroupNodeCollection, "highlightNodeForUUID:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0x11uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PGGraphBusinessNodeCollection businessNodeForBusinessMuid:inGraph:](PGGraphBusinessNodeCollection, "businessNodeForBusinessMuid:inGraph:", objc_msgSend(self->_typeSpecificIdentifier, "unsignedIntegerValue"), v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyNode");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PGFeature - legacy Business feature, ignoring", buf, 2u);
      }
      goto LABEL_56;
    case 0x12uLL:
      objc_msgSend(v4, "sceneNodeForSceneName:", self->_typeSpecificIdentifier);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0x13uLL:
      v35 = self->_typeSpecificIdentifier;
      v68 = CFSTR("id");
      v69 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("District"), 200, v36);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 0x15uLL:
      v12 = self->_typeSpecificIdentifier;
      v54 = CFSTR("id");
      v55 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("PublicEvent"), 900, v13);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 0x17uLL:
      objc_msgSend(v4, "meaningfulEventNodeForUUID:", self->_typeSpecificIdentifier);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0x18uLL:
      objc_msgSend(v4, "anyNodeForLabel:domain:properties:", self->_typeSpecificIdentifier, 504, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0x19uLL:
      objc_msgSend(v4, "anyNodeForLabel:domain:properties:", self->_typeSpecificIdentifier, 901, 0);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v6 = (id)v9;
      goto LABEL_49;
    case 0x1AuLL:
      v14 = self->_typeSpecificIdentifier;
      v52 = CFSTR("name");
      v53 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("Performer"), 900, v15);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    case 0x1BuLL:
      -[PGFeature name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", v10, v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "anyNode");
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 0x1CuLL:
      +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0x1DuLL:
LABEL_19:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:
          v19 = self->_typeSpecificIdentifier;
          v70 = CFSTR("id");
          v71[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "anyNodeForLabel:domain:properties:", CFSTR("SocialGroup"), 302, v20);
          v6 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_49;
        }
      }
      v17 = +[PGGraphCalendarUnitNode monthDayValueForMonthDayNodeCalendarUnitValue:](PGGraphCalendarUnitNode, "monthDayValueForMonthDayNodeCalendarUnitValue:", objc_msgSend(self->_typeSpecificIdentifier, "integerValue"));
      +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:day:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForMonth:day:inGraph:", v17, v18, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_47:
      v6 = (id)v11;
      goto LABEL_48;
    case 0x1EuLL:
      *(_QWORD *)buf = 0;
      v47 = buf;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__51463;
      v50 = __Block_byref_object_dispose__51464;
      v51 = 0;
      +[PGGraphHomeWorkNodeCollection homeNodesInGraph:](PGGraphHomeWorkNodeCollection, "homeNodesInGraph:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __25__PGFeature_nodeInGraph___block_invoke;
      v45[3] = &unk_1E8430F38;
      v45[4] = self;
      v45[5] = buf;
      objc_msgSend(v16, "enumerateNodesUsingBlock:", v45);

      v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x1FuLL:
      *(_QWORD *)buf = 0;
      v47 = buf;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__51463;
      v50 = __Block_byref_object_dispose__51464;
      v51 = 0;
      +[PGGraphHomeWorkNodeCollection workNodesInGraph:](PGGraphHomeWorkNodeCollection, "workNodesInGraph:", v4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __25__PGFeature_nodeInGraph___block_invoke_2;
      v44[3] = &unk_1E8430F38;
      v44[4] = self;
      v44[5] = buf;
      objc_msgSend(v39, "enumerateNodesUsingBlock:", v44);

      v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x20uLL:
      +[PGGraphHighlightTypeNodeCollection typeNodesWithLabel:inGraph:](PGGraphHighlightTypeNodeCollection, "typeNodesWithLabel:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0x21uLL:
      *(_QWORD *)buf = 0;
      v47 = buf;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__51463;
      v50 = __Block_byref_object_dispose__51464;
      v51 = 0;
      +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __25__PGFeature_nodeInGraph___block_invoke_3;
      v43[3] = &unk_1E8430F60;
      v43[4] = self;
      v43[5] = buf;
      objc_msgSend(v40, "enumerateNodesUsingBlock:", v43);

      v6 = *((id *)v47 + 5);
      _Block_object_dispose(buf, 8);

      goto LABEL_49;
    case 0x22uLL:
      +[PGGraphNodeCollection nodesInGraph:](PGGraphOverTheYearsNodeCollection, "nodesInGraph:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0x23uLL:
      +[PGGraphPetNodeCollection petNodesForLocalIdentifier:inGraph:](PGGraphPetNodeCollection, "petNodesForLocalIdentifier:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    case 0x24uLL:
      if (self->_name)
      {
        v41 = self->_typeSpecificIdentifier;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:personLocalIdentifiers:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabel:personLocalIdentifiers:inGraph:", v41, v10, v5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "anyNode");
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_45:
        v6 = (id)v38;

LABEL_48:
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PGFeature - PersonActivityMeaning has nil personLocalIdentifier", buf, 2u);
        }
LABEL_56:
        v6 = 0;
      }
LABEL_49:

      return v6;
    case 0x25uLL:
      +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:inGraph:](PGGraphAudioFeatureNodeCollection, "audioFeatureNodesForLabel:inGraph:", self->_typeSpecificIdentifier, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyNode");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    default:
      goto LABEL_49;
  }
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = v7;
    if (*((_QWORD *)v7 + 2) == self->_type)
    {
      if (self->_typeSpecificIdentifier && (v9 = (void *)*((_QWORD *)v7 + 1)) != 0)
      {
        v6 = objc_msgSend(v9, "isEqual:");
      }
      else
      {
        -[PGFeature name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "isEqualToString:", v10);

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (self->_typeSpecificIdentifier)
  {
    v3 = CFSTR(": %@ -> %@ (node)");
  }
  else if (self->_name)
  {
    v3 = CFSTR(": %@ -> %@ (name)");
  }
  else
  {
    v3 = CFSTR(": %@ -> %@");
  }
  v10.receiver = self;
  v10.super_class = (Class)PGFeature;
  v4 = v3;
  -[PGFeature description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeature name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", v4, v6, v7, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_typeSpecificIdentifier, 0);
}

void __25__PGFeature_nodeInGraph___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __25__PGFeature_nodeInGraph___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __25__PGFeature_nodeInGraph___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "featureIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (PGFeature)featureWithNode:(id)a3
{
  id v4;
  _QWORD *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v25;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = objc_msgSend(v4, "domain");
  objc_msgSend(v4, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= 401)
  {
    if (v6 <= 299)
    {
      if (v6 > 199)
      {
        switch(v6)
        {
          case 200:
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("Address")))
            {
              v9 = 7;
              goto LABEL_76;
            }
            if (objc_msgSend(v8, "isEqualToString:", CFSTR("District")))
            {
              v20 = 19;
              goto LABEL_85;
            }
            if (objc_msgSend(v8, "isEqualToString:", CFSTR("City")))
            {
              v20 = 4;
              goto LABEL_85;
            }
            if (objc_msgSend(v8, "isEqualToString:", CFSTR("State")))
            {
              v20 = 5;
              goto LABEL_85;
            }
            if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Country")))
              goto LABEL_61;
            v11 = 6;
            break;
          case 201:
            v11 = 8;
            goto LABEL_39;
          case 202:
            v14 = objc_msgSend(v7, "isEqualToString:", CFSTR("Home"));
            v15 = 30;
            if (!v14)
              v15 = 31;
            goto LABEL_41;
          case 204:
            v15 = 33;
LABEL_41:
            v5[2] = v15;
            objc_msgSend(v4, "featureIdentifier");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_59;
          default:
            goto LABEL_61;
        }
        goto LABEL_39;
      }
      if (v6 == 100)
      {
        v20 = 11;
LABEL_85:
        v5[2] = v20;
        objc_msgSend(v4, "UUID");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (v6 == 102)
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("Highlight")))
          v9 = 28;
        else
          v9 = 16;
LABEL_76:
        v5[2] = v9;
        objc_msgSend(v4, "uuid");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      if (v6 != 103)
        goto LABEL_61;
      v10 = 32;
LABEL_58:
      v5[2] = v10;
      v16 = v7;
      goto LABEL_59;
    }
    if (v6 <= 303)
    {
      if (v6 != 300)
      {
        if (v6 != 302)
          goto LABEL_61;
        v5[2] = 2;
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = objc_msgSend(v4, "socialGroupID");
        goto LABEL_74;
      }
      v18 = 3;
    }
    else
    {
      if (v6 != 304)
      {
        if (v6 != 400)
        {
          if (v6 != 401 || !objc_msgSend(v7, "isEqualToString:", CFSTR("Holiday")))
            goto LABEL_61;
          v11 = 15;
          goto LABEL_39;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("Year")))
        {
          v19 = 1;
LABEL_73:
          v5[2] = v19;
          v12 = (void *)MEMORY[0x1E0CB37E8];
          v13 = objc_msgSend(v4, "calendarUnitValue");
LABEL_74:
          objc_msgSend(v12, "numberWithInteger:", v13);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MonthDay")))
        {
          v19 = 29;
          goto LABEL_73;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Season")))
        {
          v11 = 14;
          goto LABEL_39;
        }
        goto LABEL_61;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Pet")))
        goto LABEL_61;
      v18 = 35;
    }
    v5[2] = v18;
    objc_msgSend(v4, "localIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (v6 <= 600)
  {
    switch(v6)
    {
      case 501:
        v10 = 10;
        goto LABEL_58;
      case 502:
        v10 = 9;
        goto LABEL_58;
      case 503:
        v17 = 17;
        goto LABEL_56;
      case 504:
        v10 = 24;
        goto LABEL_58;
      default:
        if (v6 != 402)
        {
          if (v6 != 600)
            goto LABEL_61;
          v10 = 18;
          goto LABEL_58;
        }
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("OverTheYears")))
          goto LABEL_61;
        v5[2] = 34;
        v25 = CFSTR("OverTheYears");
        v21 = (void *)v5[1];
        v5[1] = CFSTR("OverTheYears");
        break;
    }
    goto LABEL_60;
  }
  if (v6 <= 899)
  {
    switch(v6)
    {
      case 601:
        v10 = 27;
        break;
      case 700:
        v10 = 13;
        break;
      case 701:
        v10 = 36;
        break;
      default:
        goto LABEL_61;
    }
    goto LABEL_58;
  }
  if (v6 != 900)
  {
    if (v6 == 901)
    {
      v10 = 25;
    }
    else
    {
      if (v6 != 1201)
        goto LABEL_61;
      v10 = 37;
    }
    goto LABEL_58;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PublicEvent")))
  {
    v17 = 21;
LABEL_56:
    v5[2] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Performer")))
  {
    v11 = 26;
LABEL_39:
    v5[2] = v11;
    objc_msgSend(v4, "name");
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
    v21 = (void *)v5[1];
    v5[1] = v16;
LABEL_60:

  }
LABEL_61:
  if (v5[2])
  {
    objc_msgSend(a1, "nameForNode:", v4);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v5[3];
    v5[3] = v22;
  }
  else
  {
    v23 = v5;
    v5 = 0;
  }

  return (PGFeature *)v5;
}

+ (PGFeature)featureWithType:(unint64_t)a3 node:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;

  v6 = a4;
  if (a3 == 23)
  {
    objc_msgSend(a1, "featureWithMeaningfulEvent:", v6);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "featureWithNode:", v6);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (a3 == 20 && objc_msgSend(v8, "type") == 8)
      v7[2] = 20;
  }

  return (PGFeature *)v7;
}

+ (PGFeature)featureWithMeaningfulEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v5[2] = 23;
  objc_msgSend(v4, "UUID");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v5[1];
  v5[1] = v6;

  return (PGFeature *)v5;
}

+ (PGFeature)featureWithType:(unint64_t)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  *((_QWORD *)v8 + 2) = a3;
  objc_storeStrong((id *)v8 + 3, a4);
  v9 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v7;

  return (PGFeature *)v8;
}

+ (id)noneFeatureWithType:(unint64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return v4;
}

+ (id)nameForNode:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "domain");
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SocialGroup")))
  {
    if (v5 > 699)
    {
      if (v5 == 701)
      {
        objc_msgSend(v3, "personLocalIdentifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (v5 != 700)
        goto LABEL_11;
    }
    else if (v5 != 502)
    {
      if (v5 == 600)
      {
        objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
        v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v8 = v9;
        goto LABEL_15;
      }
LABEL_11:
      objc_msgSend(v3, "name");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "stringValue");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v6;
      }
      goto LABEL_3;
    }
    v9 = v4;
    goto LABEL_14;
  }
  v6 = v3;
  objc_msgSend(v6, "socialGroupNameWithServiceManager:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v8 = v7;

LABEL_15:
  return v8;
}

+ (id)stringForFeatureType:(unint64_t)a3
{
  if (a3 > 0x25)
    return CFSTR("Unknown");
  else
    return off_1E8430F80[a3];
}

+ (id)featuresForEncodedFeatures:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGFeature *v11;
  PGFeature *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PGFeature alloc];
        v12 = -[PGFeature initWithEncodedFeature:](v11, "initWithEncodedFeature:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
