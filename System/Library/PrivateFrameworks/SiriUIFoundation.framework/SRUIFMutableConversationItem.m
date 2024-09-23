@implementation SRUIFMutableConversationItem

- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SRUIFMutableConversationItem *v24;
  uint64_t v25;
  NSUUID *identifier;
  uint64_t v27;
  NSUUID *revisionIdentifier;
  uint64_t v29;
  NSString *aceCommandIdentifier;
  id v33;
  objc_super v34;

  v33 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a14;
  v34.receiver = self;
  v34.super_class = (Class)SRUIFMutableConversationItem;
  v24 = -[SRUIFMutableConversationItem init](&v34, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v33, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSUUID *)v25;

    v27 = objc_msgSend(v19, "copy");
    revisionIdentifier = v24->_revisionIdentifier;
    v24->_revisionIdentifier = (NSUUID *)v27;

    v24->_type = a5;
    objc_storeStrong((id *)&v24->_aceObject, a6);
    objc_storeStrong((id *)&v24->_dialogPhase, a7);
    v24->_presentationState = a8;
    v29 = objc_msgSend(v22, "copy");
    aceCommandIdentifier = v24->_aceCommandIdentifier;
    v24->_aceCommandIdentifier = (NSString *)v29;

    v24->_virgin = a10;
    v24->_transient = a11;
    v24->_supplemental = a12;
    v24->_immersiveExperience = a13;
    objc_storeStrong((id *)&v24->_associatedDataStore, a14);
  }

  return v24;
}

- (SRUIFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 associatedDataStore:(id)a13
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SRUIFMutableConversationItem *v24;
  uint64_t v26;

  v17 = (objc_class *)MEMORY[0x24BDD1880];
  v18 = a13;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = objc_alloc_init(v17);
  BYTE3(v26) = a12;
  BYTE2(v26) = a11;
  LOWORD(v26) = __PAIR16__(a10, a9);
  v24 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v22, v23, a4, v21, v20, a7, v19, v26, v18);

  return v24;
}

- (SRUIFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SRUIFMutableConversationItem *v23;
  uint64_t v25;

  v17 = (objc_class *)MEMORY[0x24BDD1880];
  v18 = a12;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(v17);
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = -[SRUIFMutableConversationItem initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v22, a3, v21, v20, a6, v19, v25, v18);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  SRUIFConversationItem *v14;
  uint64_t v16;
  int64_t v17;
  void *v18;
  SRUIFConversationItem *v19;

  v19 = [SRUIFConversationItem alloc];
  -[SRUIFMutableConversationItem identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SRUIFMutableConversationItem type](self, "type");
  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFMutableConversationItem dialogPhase](self, "dialogPhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SRUIFMutableConversationItem presentationState](self, "presentationState");
  -[SRUIFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SRUIFMutableConversationItem isVirgin](self, "isVirgin");
  v10 = -[SRUIFMutableConversationItem isTransient](self, "isTransient");
  v11 = -[SRUIFMutableConversationItem isSupplemental](self, "isSupplemental");
  v12 = -[SRUIFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience");
  -[SRUIFMutableConversationItem associatedDataStore](self, "associatedDataStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v16) = v12;
  BYTE2(v16) = v11;
  BYTE1(v16) = v10;
  LOBYTE(v16) = v9;
  v14 = -[SRUIFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v19, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v18, v4, v17, v5, v6, v7, v8, v16, v13);

  return v14;
}

- (NSString)description
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;

  v3 = -[SRUIFMutableConversationItem type](self, "type");
  if (v3 > 5)
    v4 = 0;
  else
    v4 = off_24DC1B408[v3];
  v5 = -[SRUIFMutableConversationItem presentationState](self, "presentationState");
  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_24DC1B438[v5];
  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "af_dialogIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", dialogIdentifier=%@"), v8);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_24DC1C4B0;
  }
  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[SRUIFUtilities shouldRedactSpeakableTextForAceObject:](SRUIFUtilities, "shouldRedactSpeakableTextForAceObject:", v9);

  if (v10)
  {
    v11 = CFSTR("<private>");
    v12 = CFSTR("<private>");
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", dialogText=\"%@\"), v11);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "af_text");
  v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "af_speakableText");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_13;
  v15 = &stru_24DC1C4B0;
LABEL_15:
  v34 = v6;
  v35 = v4;
  v33 = (__CFString *)v11;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, speakableText=\"%@\"), v15, v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v16;
  }
  else
  {
    v27 = v15;
  }
  v30 = (void *)MEMORY[0x24BDD17C8];
  -[SRUIFMutableConversationItem identifier](self, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  -[SRUIFMutableConversationItem dialogPhase](self, "dialogPhase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SRUIFMutableConversationItem isTransient](self, "isTransient"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (-[SRUIFMutableConversationItem isSupplemental](self, "isSupplemental"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  if (-[SRUIFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<ConversationItem %p; %@ (revision %@): type=%@, aceObject=%@, dialogPhase=%@, presentationState=%@, aceCommandIdentifier=%@%@%@, transient=%@, supplemental=%@, immersiveExperience=%@>"),
    self,
    v29,
    v17,
    v35,
    v19,
    v20,
    v34,
    v21,
    v28,
    v27,
    v22,
    v23,
    v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v25;
}

- (void)_didMutate
{
  NSUUID *v3;
  NSUUID *revisionIdentifier;

  v3 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
  revisionIdentifier = self->_revisionIdentifier;
  self->_revisionIdentifier = v3;

}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
  -[SRUIFMutableConversationItem _didMutate](self, "_didMutate");
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
  -[SRUIFMutableConversationItem _didMutate](self, "_didMutate");
}

- (id)_propertyListStringForType
{
  int64_t v2;

  v2 = -[SRUIFMutableConversationItem type](self, "type");
  if ((unint64_t)(v2 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_24DC1B458[v2 - 1];
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RecognizedSpeech")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("View")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartialSpeechResult")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Help")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AcousticID Spinner")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_propertyListStringForPresentationState
{
  int64_t v2;

  v2 = -[SRUIFMutableConversationItem presentationState](self, "presentationState");
  if ((unint64_t)(v2 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_24DC1B480[v2 - 1];
}

- (int64_t)_presentationStateForPropertyListString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Committed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Provisional")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cancelled")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_24DC264E8, CFSTR("Version"));
  -[SRUIFMutableConversationItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Identifier"));

  -[SRUIFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("RevisionIdentifier"));

  -[SRUIFMutableConversationItem _propertyListStringForType](self, "_propertyListStringForType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Type"));

  -[SRUIFMutableConversationItem aceObject](self, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("AceObject"));

  -[SRUIFMutableConversationItem dialogPhase](self, "dialogPhase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aceDialogPhaseValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("AceDialogPhase"));
  -[SRUIFMutableConversationItem _propertyListStringForPresentationState](self, "_propertyListStringForPresentationState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("PresentationState"));

  -[SRUIFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("AceCommandIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SRUIFMutableConversationItem isTransient](self, "isTransient"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("Transient"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SRUIFMutableConversationItem isSupplemental](self, "isSupplemental"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("Supplemental"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SRUIFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ImmersiveExperience"));

  -[SRUIFMutableConversationItem associatedDataStore](self, "associatedDataStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "propertyListRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("AssociatedDataStore"));
  return v3;
}

- (SRUIFMutableConversationItem)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  SRUIFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SRUIFMutableConversationItem *v10;
  void *v11;
  void *v12;
  void *v13;
  SRUIFMutableConversationItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  SRUIFMutableConversationItem *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  SRUIFDataStore *v47;
  void *v48;
  SRUIFDataStore *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  _QWORD v73[4];
  SRUIFMutableConversationItem *v74;
  _QWORD v75[4];
  SRUIFMutableConversationItem *v76;

  v4 = a3;
  v5 = objc_alloc_init(SRUIFDictionarySchema);
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Version"));

  +[SRUIFCoercion stringToUUIDCoercion](SRUIFCoercion, "stringToUUIDCoercion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Identifier"));

  +[SRUIFCoercion stringToUUIDCoercion](SRUIFCoercion, "stringToUUIDCoercion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v8, CFSTR("RevisionIdentifier"));

  v9 = MEMORY[0x24BDAC760];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke;
  v75[3] = &unk_24DC1B3E8;
  v10 = self;
  v76 = v10;
  +[SRUIFCoercion coercionWithBlock:](SRUIFCoercion, "coercionWithBlock:", v75);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v11, CFSTR("Type"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v12, CFSTR("AceObject"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v13, CFSTR("AceDialogPhase"));

  v73[0] = v9;
  v73[1] = 3221225472;
  v73[2] = __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2;
  v73[3] = &unk_24DC1B3E8;
  v14 = v10;
  v74 = v14;
  +[SRUIFCoercion coercionWithBlock:](SRUIFCoercion, "coercionWithBlock:", v73);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v15, CFSTR("PresentationState"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v16, CFSTR("AceCommandIdentifier"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v17, CFSTR("Transient"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v18, CFSTR("Supplemental"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v19, CFSTR("ImmersiveExperience"));

  v72 = 0;
  -[SRUIFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v72);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v72;
  if (!v20)
  {
    v30 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFMutableConversationItem initWithPropertyListRepresentation:].cold.1((uint64_t)v21, (uint64_t)v4, v30);
    goto LABEL_11;
  }
  objc_msgSend(v20, "objectForKey:", CFSTR("Version"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  if (v23 != 1)
  {
    v31 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFMutableConversationItem initWithPropertyListRepresentation:].cold.3(v23, v31, v32, v33, v34, v35, v36, v37);
LABEL_11:
    v38 = 0;
    goto LABEL_19;
  }
  v71 = (uint64_t)v4;
  objc_msgSend(v20, "objectForKey:", CFSTR("Identifier"));
  v70 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("RevisionIdentifier"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24)
    v24 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v69 = v24;
  objc_msgSend(v20, "objectForKey:", CFSTR("Type"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v25, "integerValue");

  v26 = (void *)MEMORY[0x24BE81080];
  objc_msgSend(v20, "objectForKey:", CFSTR("AceObject"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "aceObjectWithDictionary:", v27);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKey:", CFSTR("AceDialogPhase"));
  v29 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)v28;
  v65 = (void *)v29;
  if (v29)
    +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:](SRUIFDialogPhase, "dialogPhaseForAceDialogPhase:", v29);
  else
    +[SRUIFDialogPhase userRequestDialogPhase](SRUIFDialogPhase, "userRequestDialogPhase");
  v67 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("PresentationState"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v39, "integerValue");

  objc_msgSend(v20, "objectForKey:", CFSTR("AceCommandIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("Transient"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  objc_msgSend(v20, "objectForKey:", CFSTR("Supplemental"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "BOOLValue");

  objc_msgSend(v20, "objectForKey:", CFSTR("ImmersiveExperience"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "BOOLValue");

  v47 = [SRUIFDataStore alloc];
  objc_msgSend(v20, "objectForKey:", CFSTR("AssociatedDataStore"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[SRUIFDataStore initWithPropertyListRepresentation:](v47, "initWithPropertyListRepresentation:", v48);

  v66 = v21;
  if (v49)
  {
    BYTE3(v62) = v46;
    BYTE2(v62) = v44;
    BYTE1(v62) = v42;
    LOBYTE(v62) = 0;
    v51 = v69;
    v50 = (void *)v70;
    v52 = (void *)v67;
    v53 = v68;
    v14 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v14, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v70, v69, v64, v68, v67, v63, v40, v62, v49);
    v38 = v14;
  }
  else
  {
    v54 = *MEMORY[0x24BE08FB0];
    v51 = v69;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFMutableConversationItem initWithPropertyListRepresentation:].cold.2(v71, v54, v55, v56, v57, v58, v59, v60);
    v38 = 0;
    v50 = (void *)v70;
    v52 = (void *)v67;
    v53 = v68;
  }

  v4 = (id)v71;
  v21 = v66;
LABEL_19:

  return v38;
}

id __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coerceObject:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForPropertyListString:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __67__SRUIFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coerceObject:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_presentationStateForPropertyListString:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (SRUIFDialogPhase)dialogPhase
{
  return self->_dialogPhase;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (void)setAceCommandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (void)setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (void)setSupplemental:(BOOL)a3
{
  self->_supplemental = a3;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (void)setImmersiveExperience:(BOOL)a3
{
  self->_immersiveExperience = a3;
}

- (SRUIFDataStore)associatedDataStore
{
  return self->_associatedDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDataStore, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertyListRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[SRUIFMutableConversationItem initWithPropertyListRepresentation:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s returning nil; passed invalid property list (%{public}@): %@",
    (uint8_t *)&v3,
    0x20u);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_219F26000, a2, a3, "%s returning nil; unable co create associated data store from property list %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_219F26000, a2, a3, "%s unable to deserialize property list with version %{public}ld; returning nil",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
