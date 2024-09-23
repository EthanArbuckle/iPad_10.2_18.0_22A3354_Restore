@implementation TIInputContextHistory

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4
{
  return -[TIInputContextHistory initWithThreadIdentifier:participantsIDtoNamesMap:firstPersonIDs:primaryRecipients:secondaryRecipients:infoDict:](self, "initWithThreadIdentifier:participantsIDtoNamesMap:firstPersonIDs:primaryRecipients:secondaryRecipients:infoDict:", 0, 0, a4, a3, 0, 0);
}

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  TIInputContextHistory *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TIInputContextHistory initWithRecipientIdentifiers:senderIdentifiers:](self, "initWithRecipientIdentifiers:senderIdentifiers:", v7, v8);

  return v9;
}

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3
{
  return -[TIInputContextHistory initWithRecipientIdentifiers:senderIdentifiers:](self, "initWithRecipientIdentifiers:senderIdentifiers:", a3, 0);
}

- (TIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TIInputContextHistory *v16;
  TIInputContextHistory *v17;
  uint64_t v18;
  NSString *threadIdentifier;
  uint64_t v20;
  NSMutableDictionary *participantsIDtoNamesMap;
  void *v22;
  void *v23;
  uint64_t v24;
  NSSet *recipientIdentifiers;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TIInputContextHistory;
  v16 = -[TIInputContextHistory init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_threadID = a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
    v18 = objc_claimAutoreleasedReturnValue();
    threadIdentifier = v17->_threadIdentifier;
    v17->_threadIdentifier = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    participantsIDtoNamesMap = v17->_participantsIDtoNamesMap;
    v17->_participantsIDtoNamesMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v17->_primaryRecipientIdentifiers, a6);
    objc_storeStrong((id *)&v17->_secondaryRecipientIdentifiers, a7);
    -[TIInputContextHistory primaryRecipientIdentifiers](v17, "primaryRecipientIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputContextHistory secondaryRecipientIdentifiers](v17, "secondaryRecipientIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setByAddingObjectsFromSet:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    recipientIdentifiers = v17->_recipientIdentifiers;
    v17->_recipientIdentifiers = (NSSet *)v24;

    v17->_maxContextLength = 1024;
    objc_storeStrong((id *)&v17->_firstPersonIdentifiers, a5);
  }

  return v17;
}

- (TIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  TIInputContextHistory *v19;
  uint64_t v20;
  NSMutableDictionary *participantsIDtoNamesMap;
  void *v22;
  void *v23;
  uint64_t v24;
  NSSet *recipientIdentifiers;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v28 = a5;
  v27 = a6;
  v17 = a7;
  v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)TIInputContextHistory;
  v19 = -[TIInputContextHistory init](&v29, sel_init);
  if (v19)
  {
    v19->_threadID = objc_msgSend(v15, "integerValue", v27, v28);
    objc_storeStrong((id *)&v19->_threadIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    participantsIDtoNamesMap = v19->_participantsIDtoNamesMap;
    v19->_participantsIDtoNamesMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_primaryRecipientIdentifiers, a6);
    objc_storeStrong((id *)&v19->_secondaryRecipientIdentifiers, a7);
    -[TIInputContextHistory primaryRecipientIdentifiers](v19, "primaryRecipientIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputContextHistory secondaryRecipientIdentifiers](v19, "secondaryRecipientIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setByAddingObjectsFromSet:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    recipientIdentifiers = v19->_recipientIdentifiers;
    v19->_recipientIdentifiers = (NSSet *)v24;

    v19->_maxContextLength = 1024;
    objc_storeStrong((id *)&v19->_firstPersonIdentifiers, a5);
    objc_storeStrong((id *)&v19->_infoDict, a8);
  }

  return v19;
}

- (void)assertCheckpointForCoding
{
  TIInputContextHistory *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<NSHolder<TIInputContextEntry>, void *>>> *p_pair1;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t *v7;
  TIInputContextHistory *isa;
  TIInputContextHistory *left;
  BOOL v10;
  uint64_t v11;

  begin_node = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
  p_pair1 = &self->_pendingEntries.__tree_.__pair1_;
  if (begin_node != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
  {
    do
    {
      v5 = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>((uint64_t)&self->_entries, &v11, &begin_node->_pendingEntries.__tree_.__begin_node_);
      if (!*v5)
      {
        v6 = v5;
        v7 = (uint64_t *)operator new(0x28uLL);
        v7[4] = (uint64_t)begin_node->_pendingEntries.__tree_.__begin_node_;
        std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)&self->_entries, v11, v6, v7);
      }
      isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (TIInputContextHistory *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (TIInputContextHistory *)begin_node->_entries.__tree_.__pair1_.__value_.__left_;
          v10 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v10);
      }
      begin_node = left;
    }
    while (left != (TIInputContextHistory *)p_pair1);
  }
  std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  self->_pendingEntries.__tree_.__pair1_.__value_.__left_ = 0;
  self->_pendingEntries.__tree_.__pair3_.__value_ = 0;
  self->_pendingEntries.__tree_.__begin_node_ = p_pair1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSSet **p_primaryRecipientIdentifiers;
  const __CFString *v7;
  NSUInteger v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", self->_threadID, CFSTR("threadID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_threadIdentifier, CFSTR("threadIdentifier"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_maxContextLength, CFSTR("maxContextLength"));
  if (self->_pendingEntries.__tree_.__pair3_.__value_)
  {
    arrayFromSet<TIInputContextEntry>(&self->_pendingEntries.__tree_.__begin_node_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("pendingEntries"));

  }
  if (self->_entries.__tree_.__pair3_.__value_)
  {
    arrayFromSet<TIInputContextEntry>(&self->_entries.__tree_.__begin_node_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("entries"));

  }
  if (-[NSSet count](self->_firstPersonIdentifiers, "count"))
    objc_msgSend(v10, "encodeObject:forKey:", self->_firstPersonIdentifiers, CFSTR("firstPersonIdentifiers"));
  p_primaryRecipientIdentifiers = &self->_primaryRecipientIdentifiers;
  if (-[NSSet count](self->_primaryRecipientIdentifiers, "count"))
  {
    v7 = CFSTR("primaryRecipientIdentifiers");
  }
  else
  {
    objc_msgSend(v10, "encodeObject:forKey:", self->_recipientIdentifiers, CFSTR("recipientIdentifiers"));
    p_primaryRecipientIdentifiers = &self->_recipientNames;
    if (!-[NSSet count](self->_recipientNames, "count"))
      goto LABEL_12;
    v7 = CFSTR("recipientNames");
  }
  objc_msgSend(v10, "encodeObject:forKey:", *p_primaryRecipientIdentifiers, v7);
LABEL_12:
  if (-[NSSet count](self->_secondaryRecipientIdentifiers, "count"))
    objc_msgSend(v10, "encodeObject:forKey:", self->_secondaryRecipientIdentifiers, CFSTR("secondaryRecipientIdentifiers"));
  if (-[NSDictionary count](self->_infoDict, "count"))
    objc_msgSend(v10, "encodeObject:forKey:", self->_infoDict, CFSTR("infoDict"));
  if (-[NSMutableDictionary count](self->_participantsIDtoNamesMap, "count"))
    objc_msgSend(v10, "encodeObject:forKey:", self->_participantsIDtoNamesMap, CFSTR("participantsIDtoNamesMap"));
  v8 = -[NSString length](self->_focusedEntryIdentifier, "length");
  v9 = v10;
  if (v8)
  {
    objc_msgSend(v10, "encodeObject:forKey:", self->_focusedEntryIdentifier, CFSTR("focusedEntryIdentifier"));
    v9 = v10;
  }

}

- (TIInputContextHistory)initWithCoder:(id)a3
{
  id v4;
  TIInputContextHistory *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *threadIdentifier;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<NSHolder<TIInputContextEntry>, void *>>> *p_pair1;
  _QWORD *v21;
  unint64_t v22;
  void *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<NSHolder<TIInputContextEntry>, void *>>> *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  NSSet *firstPersonIdentifiers;
  uint64_t v29;
  NSSet *recipientNames;
  uint64_t v31;
  NSSet *primaryRecipientIdentifiers;
  uint64_t v33;
  NSSet *secondaryRecipientIdentifiers;
  uint64_t v35;
  NSSet *recipientIdentifiers;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSMutableDictionary *participantsIDtoNamesMap;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSDictionary *infoDict;
  uint64_t v49;
  NSString *focusedEntryIdentifier;
  _QWORD *v52;
  _QWORD *v53;
  unint64_t v54;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)TIInputContextHistory;
  v5 = -[TIInputContextHistory init](&v55, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_threadID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("threadID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxContextLength"));
    v18 = 1024;
    if (v17)
      v18 = v17;
    v5->_maxContextLength = v18;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("pendingEntries"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    setFromArray<TIInputContextEntry>((uint64_t)&v52, v19);
    p_pair1 = &v5->_pendingEntries.__tree_.__pair1_;
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v5->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    v21 = v53;
    v5->_pendingEntries.__tree_.__begin_node_ = v52;
    v5->_pendingEntries.__tree_.__pair1_.__value_.__left_ = v21;
    v22 = v54;
    v5->_pendingEntries.__tree_.__pair3_.__value_ = v54;
    if (v22)
    {
      v21[2] = p_pair1;
      v52 = &v53;
      v53 = 0;
      v54 = 0;
      v21 = 0;
    }
    else
    {
      v5->_pendingEntries.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v21);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("entries"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    setFromArray<TIInputContextEntry>((uint64_t)&v52, v23);
    v24 = &v5->_entries.__tree_.__pair1_;
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v5->_entries.__tree_.__pair1_.__value_.__left_);
    v5->_entries.__tree_.__begin_node_ = v52;
    v25 = v53;
    v5->_entries.__tree_.__pair1_.__value_.__left_ = v53;
    v26 = v54;
    v5->_entries.__tree_.__pair3_.__value_ = v54;
    if (v26)
    {
      v25[2] = v24;
      v52 = &v53;
      v53 = 0;
      v54 = 0;
      v25 = 0;
    }
    else
    {
      v5->_entries.__tree_.__begin_node_ = v24;
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v25);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("firstPersonIdentifiers"));
    v27 = objc_claimAutoreleasedReturnValue();
    firstPersonIdentifiers = v5->_firstPersonIdentifiers;
    v5->_firstPersonIdentifiers = (NSSet *)v27;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recipientNames"));
    v29 = objc_claimAutoreleasedReturnValue();
    recipientNames = v5->_recipientNames;
    v5->_recipientNames = (NSSet *)v29;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("primaryRecipientIdentifiers"));
    v31 = objc_claimAutoreleasedReturnValue();
    primaryRecipientIdentifiers = v5->_primaryRecipientIdentifiers;
    v5->_primaryRecipientIdentifiers = (NSSet *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("secondaryRecipientIdentifiers"));
    v33 = objc_claimAutoreleasedReturnValue();
    secondaryRecipientIdentifiers = v5->_secondaryRecipientIdentifiers;
    v5->_secondaryRecipientIdentifiers = (NSSet *)v33;

    if (-[NSSet count](v5->_primaryRecipientIdentifiers, "count"))
      -[NSSet setByAddingObjectsFromSet:](v5->_primaryRecipientIdentifiers, "setByAddingObjectsFromSet:", v5->_secondaryRecipientIdentifiers);
    else
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recipientIdentifiers"));
    v35 = objc_claimAutoreleasedReturnValue();
    recipientIdentifiers = v5->_recipientIdentifiers;
    v5->_recipientIdentifiers = (NSSet *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("participantsIDtoNamesMap"));
    v41 = objc_claimAutoreleasedReturnValue();
    participantsIDtoNamesMap = v5->_participantsIDtoNamesMap;
    v5->_participantsIDtoNamesMap = (NSMutableDictionary *)v41;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v43, v46, CFSTR("infoDict"));
    v47 = objc_claimAutoreleasedReturnValue();
    infoDict = v5->_infoDict;
    v5->_infoDict = (NSDictionary *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusedEntryIdentifier"));
    v49 = objc_claimAutoreleasedReturnValue();
    focusedEntryIdentifier = v5->_focusedEntryIdentifier;
    v5->_focusedEntryIdentifier = (NSString *)v49;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  TIInputContextHistory *v6;
  uint64_t v7;
  NSSet *recipientNames;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSSet copy](self->_recipientIdentifiers, "copy");
  v6 = (TIInputContextHistory *)objc_msgSend(v4, "initWithRecipientIdentifiers:senderIdentifiers:", v5, self->_firstPersonIdentifiers);

  if (v6)
  {
    if (v6 != self)
    {
      std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v6->_entries, (_QWORD *)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
      std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v6->_pendingEntries, (_QWORD *)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    }
    v7 = -[NSSet copy](self->_recipientNames, "copy");
    recipientNames = v6->_recipientNames;
    v6->_recipientNames = (NSSet *)v7;

    v6->_threadID = self->_threadID;
    objc_storeStrong((id *)&v6->_threadIdentifier, self->_threadIdentifier);
    objc_storeStrong((id *)&v6->_participantsIDtoNamesMap, self->_participantsIDtoNamesMap);
    objc_storeStrong((id *)&v6->_primaryRecipientIdentifiers, self->_primaryRecipientIdentifiers);
    objc_storeStrong((id *)&v6->_secondaryRecipientIdentifiers, self->_secondaryRecipientIdentifiers);
    objc_storeStrong((id *)&v6->_infoDict, self->_infoDict);
    objc_storeStrong((id *)&v6->_firstPersonIdentifiers, self->_firstPersonIdentifiers);
    objc_storeStrong((id *)&v6->_focusedEntryIdentifier, self->_focusedEntryIdentifier);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  TIInputContextHistory *begin_node;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  int v21;
  TIInputContextHistory *isa;
  TIInputContextHistory **v23;
  _QWORD *v24;
  _QWORD *v25;
  TIInputContextHistory *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  int v31;
  int v32;
  TIInputContextHistory *v33;
  TIInputContextHistory **v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSSet *primaryRecipientIdentifiers;
  void *v51;
  _BOOL4 v52;
  NSDictionary *infoDict;
  NSSet *secondaryRecipientIdentifiers;
  void *v55;
  _BOOL4 v56;
  NSString *focusedEntryIdentifier;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIInputContextHistory recipientIdentifiers](self, "recipientIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "recipientIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_71;
      v10 = (void *)v9;
      -[TIInputContextHistory recipientIdentifiers](self, "recipientIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToSet:", v12);

      if (!v13)
        goto LABEL_72;
    }
    if (self->_entries.__tree_.__pair3_.__value_ != v5[3])
      goto LABEL_72;
    begin_node = (TIInputContextHistory *)self->_entries.__tree_.__begin_node_;
    if (begin_node != (TIInputContextHistory *)&self->_entries.__tree_.__pair1_)
    {
      v16 = (_QWORD *)v5[1];
      do
      {
        v17 = begin_node->_pendingEntries.__tree_.__begin_node_;
        v18 = v16[4];
        if (v17)
          v19 = v18 == 0;
        else
          v19 = 1;
        if (v19)
        {
          if (v18)
            v20 = -1;
          else
            v20 = 0;
          if (v17)
            v21 = 1;
          else
            v21 = v20;
          if (v21)
            goto LABEL_72;
        }
        else if (objc_msgSend(v17, "compare:"))
        {
          goto LABEL_72;
        }
        isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
        v23 = (TIInputContextHistory **)begin_node;
        if (isa)
        {
          do
          {
            begin_node = isa;
            isa = (TIInputContextHistory *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            begin_node = v23[2];
            v19 = begin_node->super.isa == (Class)v23;
            v23 = (TIInputContextHistory **)begin_node;
          }
          while (!v19);
        }
        v24 = (_QWORD *)v16[1];
        if (v24)
        {
          do
          {
            v25 = v24;
            v24 = (_QWORD *)*v24;
          }
          while (v24);
        }
        else
        {
          do
          {
            v25 = (_QWORD *)v16[2];
            v19 = *v25 == (_QWORD)v16;
            v16 = v25;
          }
          while (!v19);
        }
        v16 = v25;
      }
      while (begin_node != (TIInputContextHistory *)&self->_entries.__tree_.__pair1_);
    }
    if (self->_pendingEntries.__tree_.__pair3_.__value_ != v5[6])
      goto LABEL_72;
    v26 = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
    if (v26 != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
    {
      v27 = (_QWORD *)v5[4];
      do
      {
        v28 = v26->_pendingEntries.__tree_.__begin_node_;
        v29 = v27[4];
        if (!v28 || v29 == 0)
        {
          v31 = v29 ? -1 : 0;
          v32 = v28 ? 1 : v31;
        }
        else
        {
          v32 = objc_msgSend(v28, "compare:");
        }
        if (v32)
          goto LABEL_72;
        v33 = (TIInputContextHistory *)v26->_entries.__tree_.__begin_node_;
        v34 = (TIInputContextHistory **)v26;
        if (v33)
        {
          do
          {
            v26 = v33;
            v33 = (TIInputContextHistory *)v33->super.isa;
          }
          while (v33);
        }
        else
        {
          do
          {
            v26 = v34[2];
            v19 = v26->super.isa == (Class)v34;
            v34 = (TIInputContextHistory **)v26;
          }
          while (!v19);
        }
        v35 = (_QWORD *)v27[1];
        if (v35)
        {
          do
          {
            v36 = v35;
            v35 = (_QWORD *)*v35;
          }
          while (v35);
        }
        else
        {
          do
          {
            v36 = (_QWORD *)v27[2];
            v19 = *v36 == (_QWORD)v27;
            v27 = v36;
          }
          while (!v19);
        }
        v27 = v36;
      }
      while (v26 != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_);
    }
    -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstPersonIdentifiers");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v37)
    {

    }
    else
    {
      v8 = (void *)v37;
      objc_msgSend(v5, "firstPersonIdentifiers");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38)
        goto LABEL_71;
      v39 = (void *)v38;
      -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstPersonIdentifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqualToSet:", v41);

      if (!v42)
        goto LABEL_72;
    }
    -[TIInputContextHistory recipientNames](self, "recipientNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientNames");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v43)
    {

LABEL_76:
      primaryRecipientIdentifiers = self->_primaryRecipientIdentifiers;
      if (primaryRecipientIdentifiers == (NSSet *)v5[9]
        || (objc_msgSend(v5, "primaryRecipientIdentifiers"),
            v51 = (void *)objc_claimAutoreleasedReturnValue(),
            v52 = -[NSSet isEqualToSet:](primaryRecipientIdentifiers, "isEqualToSet:", v51),
            v51,
            v52))
      {
        infoDict = self->_infoDict;
        if (infoDict == (NSDictionary *)v5[17]
          || -[NSDictionary isEqualToDictionary:](infoDict, "isEqualToDictionary:"))
        {
          secondaryRecipientIdentifiers = self->_secondaryRecipientIdentifiers;
          if (secondaryRecipientIdentifiers == (NSSet *)v5[10]
            || (objc_msgSend(v5, "secondaryRecipientIdentifiers"),
                v55 = (void *)objc_claimAutoreleasedReturnValue(),
                v56 = -[NSSet isEqualToSet:](secondaryRecipientIdentifiers, "isEqualToSet:", v55),
                v55,
                v56))
          {
            focusedEntryIdentifier = self->_focusedEntryIdentifier;
            if (focusedEntryIdentifier == (NSString *)v5[15])
              v14 = 1;
            else
              v14 = -[NSString isEqualToString:](focusedEntryIdentifier, "isEqualToString:");
            goto LABEL_73;
          }
        }
      }
LABEL_72:
      v14 = 0;
LABEL_73:

      goto LABEL_74;
    }
    v8 = (void *)v43;
    objc_msgSend(v5, "recipientNames");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      -[TIInputContextHistory recipientNames](self, "recipientNames");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientNames");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqualToSet:", v47);

      if (!v48)
        goto LABEL_72;
      goto LABEL_76;
    }
LABEL_71:

    goto LABEL_72;
  }
  v14 = 0;
LABEL_74:

  return v14;
}

- (void)updateRecipientNames:(id)a3
{
  NSSet *v4;
  NSSet *recipientNames;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  recipientNames = self->_recipientNames;
  self->_recipientNames = v4;

}

- (void)addEntry:(id)a3
{
  id v3;

  v3 = -[TIInputContextHistory _addEntry:](self, "_addEntry:", a3);
}

- (id)_addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6 primaryRecipientIdentifiers:(id)a7 secondaryRecipientIdentifiers:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TIMutableInputContextEntry *v20;
  id v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(TIMutableInputContextEntry);
  -[TIInputContextEntry setText:](v20, "setText:", v19);

  -[TIInputContextEntry setSenderIdentifier:](v20, "setSenderIdentifier:", v17);
  -[TIInputContextEntry setEntryIdentifier:](v20, "setEntryIdentifier:", v16);

  -[TIInputContextEntry setTimestamp:](v20, "setTimestamp:", v18);
  -[TIInputContextEntry setPrimaryRecipientIdentifiers:](v20, "setPrimaryRecipientIdentifiers:", v15);

  -[TIInputContextEntry setSecondaryRecipientIdentifiers:](v20, "setSecondaryRecipientIdentifiers:", v14);
  v21 = -[TIInputContextHistory _addEntry:](self, "_addEntry:", v20);
  return v20;
}

- (id)_addEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t value;
  _QWORD *begin_node;
  void *v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  set<NSHolder<TIInputContextEntry>, std::less<NSHolder<TIInputContextEntry>>, std::allocator<NSHolder<TIInputContextEntry>>> *p_entries;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *left;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  _BYTE *v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v49;

  v4 = a3;
  -[TIInputContextHistory participantsIDtoNamesMap](self, "participantsIDtoNamesMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "senderIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    -[TIInputContextHistory participantsIDtoNamesMap](self, "participantsIDtoNamesMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setSenderName:", v5);
  }

LABEL_5:
  objc_msgSend(v4, "enforceMaxContextLength:", -[TIInputContextHistory maxContextLength](self, "maxContextLength"));
  v9 = v4;
  v49 = v9;
  std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>((uint64_t **)&self->_pendingEntries, &v49, (uint64_t *)&v49);

  value = self->_entries.__tree_.__pair3_.__value_;
  if (value + self->_pendingEntries.__tree_.__pair3_.__value_ < 0x10)
    return v9;
  do
  {
    begin_node = self->_pendingEntries.__tree_.__begin_node_;
    if (value)
    {
      v12 = (void *)*((_QWORD *)self->_entries.__tree_.__begin_node_ + 4);
      v13 = begin_node[4];
      if (v12)
        v14 = v13 == 0;
      else
        v14 = 1;
      if (v14)
      {
        if (v13)
          v15 = -1;
        else
          v15 = 0;
        if (v12)
          v17 = 1;
        else
          v17 = v15;
      }
      else
      {
        v17 = objc_msgSend(v12, "compare:");
      }
      if (v17 < 0)
        p_entries = &self->_entries;
      else
        p_entries = &self->_pendingEntries;
      begin_node = p_entries->__tree_.__begin_node_;
    }
    else
    {
      p_entries = &self->_pendingEntries;
    }
    v18 = (_QWORD *)begin_node[1];
    v19 = begin_node;
    if (v18)
    {
      do
      {
        v20 = v18;
        v18 = (_QWORD *)*v18;
      }
      while (v18);
    }
    else
    {
      do
      {
        v20 = (_QWORD *)v19[2];
        v14 = *v20 == (_QWORD)v19;
        v19 = v20;
      }
      while (!v14);
    }
    p_entries->__tree_.__begin_node_ = v20;
    left = p_entries->__tree_.__pair1_.__value_.__left_;
    --p_entries->__tree_.__pair3_.__value_;
    v22 = *begin_node;
    v23 = begin_node;
    if (*begin_node)
    {
      v24 = (_QWORD *)begin_node[1];
      if (!v24)
      {
        v23 = begin_node;
LABEL_34:
        v25 = 0;
        *(_QWORD *)(v22 + 16) = v23[2];
        goto LABEL_35;
      }
      do
      {
        v23 = v24;
        v24 = (_QWORD *)*v24;
      }
      while (v24);
    }
    v22 = v23[1];
    if (v22)
      goto LABEL_34;
    v25 = 1;
LABEL_35:
    v26 = (_QWORD *)v23[2];
    v27 = (_QWORD *)*v26;
    if ((_QWORD *)*v26 == v23)
    {
      *v26 = v22;
      if (v23 == left)
      {
        v27 = 0;
        left = (_QWORD *)v22;
      }
      else
      {
        v27 = (_QWORD *)v26[1];
      }
    }
    else
    {
      v26[1] = v22;
    }
    v28 = *((unsigned __int8 *)v23 + 24);
    if (v23 != begin_node)
    {
      v29 = begin_node[2];
      v23[2] = v29;
      *(_QWORD *)(v29 + 8 * (*(_QWORD *)begin_node[2] != (_QWORD)begin_node)) = v23;
      v31 = *begin_node;
      v30 = begin_node[1];
      *(_QWORD *)(v31 + 16) = v23;
      *v23 = v31;
      v23[1] = v30;
      if (v30)
        *(_QWORD *)(v30 + 16) = v23;
      *((_BYTE *)v23 + 24) = *((_BYTE *)begin_node + 24);
      if (left == begin_node)
        left = v23;
    }
    if (!v28 || !left)
      goto LABEL_99;
    if (!v25)
    {
      *(_BYTE *)(v22 + 24) = 1;
      goto LABEL_99;
    }
    while (1)
    {
      v32 = v27[2];
      if (*(_QWORD **)v32 != v27)
        break;
      if (!*((_BYTE *)v27 + 24))
      {
        *((_BYTE *)v27 + 24) = 1;
        *(_BYTE *)(v32 + 24) = 0;
        v38 = v27[1];
        *(_QWORD *)v32 = v38;
        if (v38)
          *(_QWORD *)(v38 + 16) = v32;
        v27[2] = *(_QWORD *)(v32 + 16);
        *(_QWORD *)(*(_QWORD *)(v32 + 16) + 8 * (**(_QWORD **)(v32 + 16) != v32)) = v27;
        v27[1] = v32;
        *(_QWORD *)(v32 + 16) = v27;
        if (left == (_QWORD *)v32)
          left = v27;
        v27 = *(_QWORD **)v32;
      }
      v39 = (_BYTE *)*v27;
      if (*v27 && !v39[24])
        goto LABEL_94;
      v40 = (uint64_t *)v27[1];
      if (v40 && !*((_BYTE *)v40 + 24))
      {
        if (v39 && !v39[24])
        {
LABEL_94:
          v40 = v27;
        }
        else
        {
          *((_BYTE *)v40 + 24) = 1;
          *((_BYTE *)v27 + 24) = 0;
          v46 = *v40;
          v27[1] = *v40;
          if (v46)
            *(_QWORD *)(v46 + 16) = v27;
          v40[2] = v27[2];
          *(_QWORD *)(v27[2] + 8 * (*(_QWORD *)v27[2] != (_QWORD)v27)) = v40;
          *v40 = (uint64_t)v27;
          v27[2] = v40;
          v39 = v27;
        }
        v43 = v40[2];
        *((_BYTE *)v40 + 24) = *(_BYTE *)(v43 + 24);
        *(_BYTE *)(v43 + 24) = 1;
        v39[24] = 1;
        v44 = *(uint64_t **)v43;
        v47 = *(_QWORD *)(*(_QWORD *)v43 + 8);
        *(_QWORD *)v43 = v47;
        if (v47)
          *(_QWORD *)(v47 + 16) = v43;
        v44[2] = *(_QWORD *)(v43 + 16);
        *(_QWORD *)(*(_QWORD *)(v43 + 16) + 8 * (**(_QWORD **)(v43 + 16) != v43)) = v44;
        v44[1] = v43;
        goto LABEL_98;
      }
      *((_BYTE *)v27 + 24) = 0;
      v37 = (_BYTE *)v27[2];
      if (v37[24])
        v41 = v37 == (_BYTE *)left;
      else
        v41 = 1;
      if (v41)
        goto LABEL_79;
LABEL_76:
      v27 = *(_QWORD **)(*((_QWORD *)v37 + 2) + 8 * (**((_QWORD **)v37 + 2) == (_QWORD)v37));
    }
    if (!*((_BYTE *)v27 + 24))
    {
      *((_BYTE *)v27 + 24) = 1;
      *(_BYTE *)(v32 + 24) = 0;
      v33 = *(uint64_t **)(v32 + 8);
      v34 = *v33;
      *(_QWORD *)(v32 + 8) = *v33;
      if (v34)
        *(_QWORD *)(v34 + 16) = v32;
      v33[2] = *(_QWORD *)(v32 + 16);
      *(_QWORD *)(*(_QWORD *)(v32 + 16) + 8 * (**(_QWORD **)(v32 + 16) != v32)) = v33;
      *v33 = v32;
      *(_QWORD *)(v32 + 16) = v33;
      if (left == (_QWORD *)*v27)
        left = v27;
      v27 = *(_QWORD **)(*v27 + 8);
    }
    v35 = (_QWORD *)*v27;
    if (!*v27 || *((_BYTE *)v35 + 24))
    {
      v36 = (_QWORD *)v27[1];
      if (v36 && !*((_BYTE *)v36 + 24))
        goto LABEL_85;
      *((_BYTE *)v27 + 24) = 0;
      v37 = (_BYTE *)v27[2];
      if (v37 == (_BYTE *)left)
      {
        v37 = left;
LABEL_79:
        v37[24] = 1;
        goto LABEL_99;
      }
      if (!v37[24])
        goto LABEL_79;
      goto LABEL_76;
    }
    v36 = (_QWORD *)v27[1];
    if (v36 && !*((_BYTE *)v36 + 24))
    {
LABEL_85:
      v35 = v27;
    }
    else
    {
      *((_BYTE *)v35 + 24) = 1;
      *((_BYTE *)v27 + 24) = 0;
      v42 = v35[1];
      *v27 = v42;
      if (v42)
        *(_QWORD *)(v42 + 16) = v27;
      v35[2] = v27[2];
      *(_QWORD *)(v27[2] + 8 * (*(_QWORD *)v27[2] != (_QWORD)v27)) = v35;
      v35[1] = v27;
      v27[2] = v35;
      v36 = v27;
    }
    v43 = v35[2];
    *((_BYTE *)v35 + 24) = *(_BYTE *)(v43 + 24);
    *(_BYTE *)(v43 + 24) = 1;
    *((_BYTE *)v36 + 24) = 1;
    v44 = *(uint64_t **)(v43 + 8);
    v45 = *v44;
    *(_QWORD *)(v43 + 8) = *v44;
    if (v45)
      *(_QWORD *)(v45 + 16) = v43;
    v44[2] = *(_QWORD *)(v43 + 16);
    *(_QWORD *)(*(_QWORD *)(v43 + 16) + 8 * (**(_QWORD **)(v43 + 16) != v43)) = v44;
    *v44 = v43;
LABEL_98:
    *(_QWORD *)(v43 + 16) = v44;
LABEL_99:

    operator delete(begin_node);
    value = self->_entries.__tree_.__pair3_.__value_;
  }
  while (value + self->_pendingEntries.__tree_.__pair3_.__value_ > 0xF);
  return v9;
}

- (void)enumerateAllContextEntryObjects:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__TIInputContextHistory_enumerateAllContextEntryObjects___block_invoke;
  v6[3] = &unk_1E243A908;
  v7 = v4;
  v5 = v4;
  -[TIInputContextHistory _enumerateAllEntriesAsInputContextEntries:](self, "_enumerateAllEntriesAsInputContextEntries:", v6);

}

- (void)_enumerateAllEntriesAsInputContextEntries:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  char v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t i;
  char v16;
  _QWORD *v17;
  _QWORD v18[2];
  _QWORD *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    v16 = 0;
    v18[0] = 0;
    v18[1] = 0;
    v17 = v18;
    std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v17, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
    v20[0] = 0;
    v20[1] = 0;
    v19 = v20;
    std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v19, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = v5;
      v8 = &v18[3 * v6 - 1];
      v11 = (_QWORD *)*v8;
      v9 = v8 + 1;
      v10 = v11;
      if (v11 != v9)
        break;
LABEL_11:
      v5 = 1;
      v6 = 1;
      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    while (1)
    {
      v4[2](v4, v10[4], &v16);
      if (v16)
        break;
      v12 = (_QWORD *)v10[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)v10[2];
          v14 = *v13 == (_QWORD)v10;
          v10 = v13;
        }
        while (!v14);
      }
      v10 = v13;
      if (v13 == v9)
        goto LABEL_11;
    }
LABEL_12:
    for (i = 4; i != -2; i -= 3)
      std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v18[i - 1]);
  }

}

- (void)enumeratePendingEntries:(id)a3
{
  void (**v4)(id, void *, void *, void *, NSSet *, _BYTE *);
  TIInputContextHistory *begin_node;
  void *v6;
  void *v7;
  void *v8;
  TIInputContextHistory *isa;
  TIInputContextHistory *left;
  BOOL v11;
  char v12;

  v4 = (void (**)(id, void *, void *, void *, NSSet *, _BYTE *))a3;
  if (v4)
  {
    v12 = 0;
    begin_node = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
    if (begin_node != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
    {
      do
      {
        objc_msgSend(begin_node->_pendingEntries.__tree_.__begin_node_, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(begin_node->_pendingEntries.__tree_.__begin_node_, "timestamp");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(begin_node->_pendingEntries.__tree_.__begin_node_, "senderIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v6, v7, v8, self->_recipientIdentifiers, &v12);

        if (v12)
          break;
        isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
        if (isa)
        {
          do
          {
            left = isa;
            isa = (TIInputContextHistory *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            left = (TIInputContextHistory *)begin_node->_entries.__tree_.__pair1_.__value_.__left_;
            v11 = left->super.isa == (Class)begin_node;
            begin_node = left;
          }
          while (!v11);
        }
        begin_node = left;
      }
      while (left != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_);
    }
  }

}

- (void)appendPendingEntriesFromInputContextHistory:(id)a3
{
  void **v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void **v10;
  BOOL v11;
  _QWORD *v12;

  v12 = a3;
  if (v12)
  {
    v4 = (void **)v12[4];
    if (v4 != v12 + 5)
    {
      do
      {
        v5 = v4 + 4;
        if (!std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>((_QWORD *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_, v4 + 4)&& !std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>((_QWORD *)self->_entries.__tree_.__pair1_.__value_.__left_, v4 + 4))
        {
          objc_msgSend(*v5, "text");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v5, "timestamp");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v5, "senderIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIInputContextHistory addTextEntry:timestamp:senderIdentifier:](self, "addTextEntry:timestamp:senderIdentifier:", v6, v7, v8);

        }
        v9 = (void **)v4[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (void **)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (void **)v4[2];
            v11 = *v10 == v4;
            v4 = v10;
          }
          while (!v11);
        }
        v4 = v10;
      }
      while (v10 != v12 + 5);
    }
  }

}

- (BOOL)hasPendingEntries
{
  return self->_pendingEntries.__tree_.__pair3_.__value_ != 0;
}

- (NSString)aggregateText
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TIInputContextHistory_aggregateText__block_invoke;
  v6[3] = &unk_1E243A930;
  v4 = v3;
  v7 = v4;
  -[TIInputContextHistory enumerateAllEntries:](self, "enumerateAllEntries:", v6);

  return (NSString *)v4;
}

- (NSString)mostRecentNonSenderTextEntry
{
  char v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t i;
  void *v25;
  _QWORD *v27;
  _QWORD v28[2];
  _QWORD *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v27, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v29, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  v3 = 0;
  v4 = 0;
  v5 = 1;
  v6 = &v27;
  do
  {
    v7 = v3;
    v8 = v6 + 1;
    if (v6 + 1 != (_QWORD *)*v6)
    {
      while (1)
      {
        -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *v8;
        v11 = v8;
        if (*v8)
        {
          do
          {
            v12 = v10;
            v10 = *(_QWORD *)(v10 + 8);
          }
          while (v10);
        }
        else
        {
          do
          {
            v12 = v11[2];
            v13 = *(_QWORD *)v12 == (_QWORD)v11;
            v11 = (_QWORD *)v12;
          }
          while (v13);
        }
        objc_msgSend(*(id *)(v12 + 32), "senderIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "containsObject:", v14);

        if ((v15 & 1) == 0)
          break;
        v16 = (_QWORD *)*v8;
        if (*v8)
        {
          do
          {
            v17 = v16;
            v16 = (_QWORD *)v16[1];
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (_QWORD *)v8[2];
            v13 = *v17 == (_QWORD)v8;
            v8 = v17;
          }
          while (v13);
        }
        v8 = v17;
        if (v17 == (_QWORD *)*v6)
          goto LABEL_26;
      }
      if (!v4)
        goto LABEL_21;
      v18 = (_QWORD *)*v8;
      v19 = v8;
      if (*v8)
      {
        do
        {
          v20 = v18;
          v18 = (_QWORD *)v18[1];
        }
        while (v18);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v19[2];
          v13 = *v20 == (_QWORD)v19;
          v19 = v20;
        }
        while (v13);
      }
      if (v20[4] && (objc_msgSend(v4, "compare:") & 0x80000000) != 0)
      {
LABEL_21:
        v21 = *v8;
        if (*v8)
        {
          do
          {
            v22 = v21;
            v21 = *(_QWORD *)(v21 + 8);
          }
          while (v21);
        }
        else
        {
          do
          {
            v22 = v8[2];
            v13 = *(_QWORD *)v22 == (_QWORD)v8;
            v8 = (_QWORD *)v22;
          }
          while (v13);
        }
        v23 = *(id *)(v22 + 32);

        v4 = v23;
      }
    }
LABEL_26:
    v6 = &v28[3 * v5 - 1];
    v3 = 1;
    v5 = 2;
  }
  while ((v7 & 1) == 0);
  for (i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v28[i - 1]);
  objc_msgSend(v4, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v25;
}

- (id)mostRecentTextEntry
{
  char v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t i;
  _QWORD *v19;
  _QWORD v20[2];
  _QWORD *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v20[0] = 0;
  v20[1] = 0;
  v19 = v20;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v19, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  v22[0] = 0;
  v22[1] = 0;
  v21 = v22;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v21, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  v3 = 0;
  v4 = 0;
  v5 = 1;
  v6 = &v19;
  do
  {
    v7 = v3;
    if (v6[2])
    {
      if (!v4)
        goto LABEL_10;
      v8 = v6 + 1;
      v9 = (_QWORD *)v6[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v8[2];
          v11 = *v10 == (_QWORD)v8;
          v8 = v10;
        }
        while (v11);
      }
      if (v10[4] && (objc_msgSend(v4, "compare:") & 0x80000000) != 0)
      {
LABEL_10:
        v14 = v6[1];
        v13 = v6 + 1;
        v12 = v14;
        if (v14)
        {
          do
          {
            v15 = v12;
            v12 = *(_QWORD *)(v12 + 8);
          }
          while (v12);
        }
        else
        {
          do
          {
            v15 = v13[2];
            v11 = *(_QWORD *)v15 == (_QWORD)v13;
            v13 = (_QWORD *)v15;
          }
          while (v11);
        }
        v16 = *(id *)(v15 + 32);

        v4 = v16;
      }
    }
    v6 = &v20[3 * v5 - 1];
    v3 = 1;
    v5 = 2;
  }
  while ((v7 & 1) == 0);
  for (i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v20[i - 1]);
  return v4;
}

- (NSString)mostRecentTextEntryLogString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TIInputContextHistory mostRecentTextEntry](self, "mostRecentTextEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "containsObject:", v5);

  objc_msgSend(v3, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = &stru_1E243B990;
    do
    {
      v14 = 0;
      v15 = v13;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        v17 = objc_msgSend(v16, "length");
        if (v17)
        {
          objc_msgSend(v16, "substringToIndex:", 1);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v18 = v8;
        }
        else
        {
          v18 = &stru_1E243B990;
        }
        -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v18);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v17)
        ++v14;
        v15 = v13;
      }
      while (v11 != v14);
      v11 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }
  else
  {
    v13 = &stru_1E243B990;
  }

  v19 = CFSTR("n");
  if (v22)
    v19 = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|%@"), v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (BOOL)mostRecentTextEntryIsByMe
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[TIInputContextHistory mostRecentTextEntry](self, "mostRecentTextEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)mostRecentTextEntries:(unint64_t)a3
{
  void *v4;
  int v5;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  uint64_t i;
  id v22;
  _QWORD *v24;
  _QWORD v25[2];
  _QWORD *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = 0;
  v24 = v25;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v24, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  v27[0] = 0;
  v27[1] = 0;
  v26 = v27;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v26, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  v5 = 0;
  LOBYTE(self) = 0;
  v7 = 1;
  v8 = &v24;
  while (1)
  {
    v9 = (char)self;
    v10 = v8 + 1;
    if (v8 + 1 != (_QWORD *)*v8)
      break;
LABEL_19:
    v8 = &v25[3 * v7 - 1];
    LODWORD(self) = 1;
    v7 = 2;
    if ((v9 & 1) != 0)
      goto LABEL_22;
  }
  v11 = v5;
  if (a3 <= v5)
    v12 = v5;
  else
    v12 = a3;
  while (v11 != v12)
  {
    v13 = *v10;
    v14 = v10;
    if (*v10)
    {
      do
      {
        v15 = v13;
        v13 = *(_QWORD *)(v13 + 8);
      }
      while (v13);
    }
    else
    {
      do
      {
        v15 = v14[2];
        v16 = *(_QWORD *)v15 == (_QWORD)v14;
        v14 = (_QWORD *)v15;
      }
      while (v16);
    }
    objc_msgSend(*(id *)(v15 + 32), "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v4, "insertObject:atIndex:", v17, 0);

    v18 = (_QWORD *)*v10;
    if (*v10)
    {
      do
      {
        v19 = v18;
        v18 = (_QWORD *)v18[1];
      }
      while (v18);
    }
    else
    {
      do
      {
        v19 = (_QWORD *)v10[2];
        v16 = *v19 == (_QWORD)v10;
        v10 = v19;
      }
      while (v16);
    }
    ++v11;
    v10 = v19;
    if (v19 == (_QWORD *)*v8)
    {
      v5 = v11;
      goto LABEL_19;
    }
  }
  v20 = v4;
  LODWORD(self) = 0;
LABEL_22:
  for (i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)v25[i - 1]);
  if ((_DWORD)self)
    v22 = v4;

  return v4;
}

- (NSString)senderIdentifier
{
  return (NSString *)-[NSSet anyObject](self->_firstPersonIdentifiers, "anyObject");
}

- (NSSet)senderIdentifiers
{
  return self->_firstPersonIdentifiers;
}

- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[TIInputContextHistory participantsIDtoNamesMap](self, "participantsIDtoNamesMap");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: pendingEntries: %lu, entries: %lu>"), v5, self, self->_pendingEntries.__tree_.__pair3_.__value_, self->_entries.__tree_.__pair3_.__value_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  BOOL v8;
  const __CFString *v9;
  objc_class *v10;
  void *v11;
  unint64_t value;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  const __CFString *v21;

  -[TIInputContextHistory mostRecentTextEntry](self, "mostRecentTextEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[TIInputContextHistory threadIdentifier](self, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Valid");
  if (objc_msgSend(v6, "length"))
  {
    if (v5)
      v8 = self->_entries.__tree_.__pair3_.__value_ == 0;
    else
      v8 = 1;
    if (v8)
      v9 = CFSTR("Invalid");
    else
      v9 = CFSTR("Valid");
    v21 = v9;
  }
  else
  {
    v21 = CFSTR("Invalid");
  }

  v20 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_entries.__tree_.__pair3_.__value_;
  -[TIInputContextHistory threadIdentifier](self, "threadIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v7 = CFSTR("Invalid");
  -[TIInputContextHistory mostRecentTextEntry](self, "mostRecentTextEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIInputContextHistory mostRecentTextEntryIsByMe](self, "mostRecentTextEntryIsByMe"))
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  if (-[TIInputContextHistory allParticipantsKnown](self, "allParticipantsKnown"))
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@ %p (%@) entries: %lu, threadIdentifier: %@, lastEntry (%@) entryId: %@, byMe: %@, known: %@>"), v11, self, v21, value, v13, v7, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)allParticipantsKnown
{
  TIInputContextHistory *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  -[TIInputContextHistory primaryRecipientIdentifiers](self, "primaryRecipientIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputContextHistory secondaryRecipientIdentifiers](v2, "secondaryRecipientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__TIInputContextHistory_allParticipantsKnown__block_invoke;
  v7[3] = &unk_1E243A958;
  v7[4] = v2;
  v7[5] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  LOBYTE(v2) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (BOOL)validateForSmartReplyGeneration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[TIInputContextHistory recipientIdentifiers](self, "recipientIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[TIInputContextHistory primaryRecipientIdentifiers](self, "primaryRecipientIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[TIInputContextHistory firstPersonIdentifiers](self, "firstPersonIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        -[TIInputContextHistory participantsIDtoNamesMap](self, "participantsIDtoNamesMap");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          -[TIInputContextHistory mostRecentTextEntry](self, "mostRecentTextEntry");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "text");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "length"))
          {
            if (self->_entries.__tree_.__pair3_.__value_)
              v9 = 1;
            else
              v9 = self->_pendingEntries.__tree_.__pair3_.__value_ != 0;
          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4
{
  -[TIInputContextHistory addTextEntry:timestamp:senderIdentifier:](self, "addTextEntry:timestamp:senderIdentifier:", a3, a4, 0);
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5
{
  id v5;

  v5 = -[TIInputContextHistory _addTextEntry:timestamp:senderIdentifier:entryIdentifier:primaryRecipientIdentifiers:secondaryRecipientIdentifiers:](self, "_addTextEntry:timestamp:senderIdentifier:entryIdentifier:primaryRecipientIdentifiers:secondaryRecipientIdentifiers:", a3, a4, a5, 0, 0, 0);
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6
{
  id v6;

  v6 = -[TIInputContextHistory _addTextEntry:timestamp:senderIdentifier:entryIdentifier:primaryRecipientIdentifiers:secondaryRecipientIdentifiers:](self, "_addTextEntry:timestamp:senderIdentifier:entryIdentifier:primaryRecipientIdentifiers:secondaryRecipientIdentifiers:", a3, a4, a5, a6, 0, 0);
}

- (void)enumerateAllEntries:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__TIInputContextHistory_enumerateAllEntries___block_invoke;
  v6[3] = &unk_1E243A908;
  v7 = v4;
  v5 = v4;
  -[TIInputContextHistory _enumerateAllEntriesAsInputContextEntries:](self, "_enumerateAllEntriesAsInputContextEntries:", v6);

}

- (void)enumerateAllContextEntries:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__TIInputContextHistory_enumerateAllContextEntries___block_invoke;
  v6[3] = &unk_1E243A908;
  v7 = v4;
  v5 = v4;
  -[TIInputContextHistory _enumerateAllEntriesAsInputContextEntries:](self, "_enumerateAllEntriesAsInputContextEntries:", v6);

}

- (void)enumerateAllContextEntriesWithEntryId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__TIInputContextHistory_enumerateAllContextEntriesWithEntryId___block_invoke;
  v6[3] = &unk_1E243A908;
  v7 = v4;
  v5 = v4;
  -[TIInputContextHistory _enumerateAllEntriesAsInputContextEntries:](self, "_enumerateAllEntriesAsInputContextEntries:", v6);

}

- (NSSet)recipientIdentifiers
{
  return self->_recipientIdentifiers;
}

- (NSSet)recipientNames
{
  return self->_recipientNames;
}

- (NSSet)primaryRecipientIdentifiers
{
  return self->_primaryRecipientIdentifiers;
}

- (NSSet)secondaryRecipientIdentifiers
{
  return self->_secondaryRecipientIdentifiers;
}

- (NSSet)firstPersonIdentifiers
{
  return self->_firstPersonIdentifiers;
}

- (NSMutableDictionary)participantsIDtoNamesMap
{
  return self->_participantsIDtoNamesMap;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)focusedEntryIdentifier
{
  return self->_focusedEntryIdentifier;
}

- (void)setFocusedEntryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)maxContextLength
{
  return self->_maxContextLength;
}

- (void)setMaxContextLength:(unint64_t)a3
{
  self->_maxContextLength = a3;
}

- (NSDictionary)infoDict
{
  return self->_infoDict;
}

- (void)setInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_infoDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDict, 0);
  objc_storeStrong((id *)&self->_focusedEntryIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_participantsIDtoNamesMap, 0);
  objc_storeStrong((id *)&self->_firstPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_secondaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipientNames, 0);
  objc_storeStrong((id *)&self->_recipientIdentifiers, 0);
  std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  std::__tree<NSHolder<TIInputContextEntry>>::destroy((_QWORD *)self->_entries.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

void __63__TIInputContextHistory_enumerateAllContextEntriesWithEntryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "text");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, void *, void *, uint64_t))(v4 + 16))(v4, v10, v6, v7, v8, v9, a3);
}

void __52__TIInputContextHistory_enumerateAllContextEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "text");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, void *, uint64_t))(v4 + 16))(v4, v9, v6, v7, v8, a3);
}

void __45__TIInputContextHistory_enumerateAllEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v4 + 16))(v4, v8, v6, v7, a3);
}

void __45__TIInputContextHistory_allParticipantsKnown__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "participantsIDtoNamesMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "nameComponentsAreEmpty:", v8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }

}

uint64_t __38__TIInputContextHistory_aggregateText__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __57__TIInputContextHistory_enumerateAllContextEntryObjects___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)nameComponentsAreEmpty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;

  v4 = a3;
  objc_msgSend(v4, "givenName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E243B990);

    if (!v8)
      goto LABEL_13;
  }
  objc_msgSend(v4, "middleName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "middleName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E243B990);

    if (!v12)
      goto LABEL_13;
  }
  objc_msgSend(v4, "familyName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v4, "familyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", &stru_1E243B990);

    if (!v16)
      goto LABEL_13;
  }
  objc_msgSend(v4, "nameSuffix");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v4, "nameSuffix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", &stru_1E243B990);

    if (!v20)
      goto LABEL_13;
  }
  objc_msgSend(v4, "nickname");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_11;
  v22 = (void *)v21;
  objc_msgSend(v4, "nickname");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", &stru_1E243B990);

  if (!v24)
  {
LABEL_13:
    v27 = 0;
  }
  else
  {
LABEL_11:
    objc_msgSend(v4, "phoneticRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v4, "phoneticRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(a1, "nameComponentsAreEmpty:", v26);

    }
    else
    {
      v27 = 1;
    }

  }
  return v27;
}

@end
