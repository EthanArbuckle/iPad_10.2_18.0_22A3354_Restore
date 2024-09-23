@implementation WBSFormControlMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSFormControlMetadata)initWithCoder:(id)a3
{
  id v4;
  WBSFormControlMetadata *v5;
  uint64_t v6;
  NSString *addressBookLabel;
  uint64_t v8;
  NSString *associatedUsername;
  uint64_t v10;
  NSString *fieldClass;
  uint64_t v12;
  NSString *fieldID;
  uint64_t v14;
  NSString *fieldName;
  uint64_t v16;
  NSString *tagName;
  uint64_t v18;
  NSString *uniqueID;
  uint64_t v20;
  NSString *nextControlUniqueID;
  uint64_t v22;
  NSString *placeholder;
  uint64_t v24;
  NSString *value;
  uint64_t v26;
  NSString *passwordRules;
  uint64_t v28;
  NSString *requiredFormatForDateTimeInput;
  uint64_t v30;
  NSString *classification;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  NSDictionary *annotations;
  __objc2_prot_list **p_prots;
  uint64_t v39;
  NSArray *autocompleteTokens;
  uint64_t v41;
  NSDictionary *radioButtonInfo;
  uint64_t v43;
  NSArray *ancestorFrameURLs;
  void *v45;
  NSArray *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  NSArray *selectElementInfo;
  uint64_t v57;
  NSArray *orderedParts;
  uint64_t v59;
  NSArray *classificationHints;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[WBSFormControlMetadata init](self, "init");
  if (setUpEncodingClasses_onceToken != -1)
    dispatch_once(&setUpEncodingClasses_onceToken, &__block_literal_global_47);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("a"));
  v6 = objc_claimAutoreleasedReturnValue();
  addressBookLabel = v5->_addressBookLabel;
  v5->_addressBookLabel = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("d"));
  v8 = objc_claimAutoreleasedReturnValue();
  associatedUsername = v5->_associatedUsername;
  v5->_associatedUsername = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("f"));
  v10 = objc_claimAutoreleasedReturnValue();
  fieldClass = v5->_fieldClass;
  v5->_fieldClass = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("g"));
  v12 = objc_claimAutoreleasedReturnValue();
  fieldID = v5->_fieldID;
  v5->_fieldID = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("h"));
  v14 = objc_claimAutoreleasedReturnValue();
  fieldName = v5->_fieldName;
  v5->_fieldName = (NSString *)v14;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("i"));
  v16 = objc_claimAutoreleasedReturnValue();
  tagName = v5->_tagName;
  v5->_tagName = (NSString *)v16;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("j"));
  v18 = objc_claimAutoreleasedReturnValue();
  uniqueID = v5->_uniqueID;
  v5->_uniqueID = (NSString *)v18;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("k"));
  v20 = objc_claimAutoreleasedReturnValue();
  nextControlUniqueID = v5->_nextControlUniqueID;
  v5->_nextControlUniqueID = (NSString *)v20;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("1"));
  v22 = objc_claimAutoreleasedReturnValue();
  placeholder = v5->_placeholder;
  v5->_placeholder = (NSString *)v22;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("l"));
  v24 = objc_claimAutoreleasedReturnValue();
  value = v5->_value;
  v5->_value = (NSString *)v24;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("e"));
  v26 = objc_claimAutoreleasedReturnValue();
  passwordRules = v5->_passwordRules;
  v5->_passwordRules = (NSString *)v26;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("3"));
  v28 = objc_claimAutoreleasedReturnValue();
  requiredFormatForDateTimeInput = v5->_requiredFormatForDateTimeInput;
  v5->_requiredFormatForDateTimeInput = (NSString *)v28;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", nsStringClassSet, CFSTR("4"));
  v30 = objc_claimAutoreleasedReturnValue();
  classification = v5->_classification;
  v5->_classification = (NSString *)v30;

  v5->_size = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("s"));
  v5->_maxLength = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("t"));
  v5->_minLength = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("u"));
  v5->_selectionStart = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("v"));
  v5->_selectionLength = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("w"));
  v5->_autoFillButtonType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("y"));
  v5->_lastAutoFillButtonType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("z"));
  v5->_continuationID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("5"));
  v5->_continuationIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("6"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("o"));
  v5->_rectLeft = v32;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("p"));
  v5->_rectTop = v33;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("q"));
  v5->_rectWidth = v34;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("r"));
  v5->_rectHeight = v35;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", stringDictionaryClasses, CFSTR("b"));
  v36 = objc_claimAutoreleasedReturnValue();
  annotations = v5->_annotations;
  v5->_annotations = (NSDictionary *)v36;

  p_prots = &OBJC_PROTOCOL___WBSCoalescedAsynchronousWriterDelegate.prots;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", stringArrayClasses, CFSTR("c"));
  v39 = objc_claimAutoreleasedReturnValue();
  autocompleteTokens = v5->_autocompleteTokens;
  v5->_autocompleteTokens = (NSArray *)v39;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", stringArrayDictionaryClasses, CFSTR("m"));
  v41 = objc_claimAutoreleasedReturnValue();
  radioButtonInfo = v5->_radioButtonInfo;
  v5->_radioButtonInfo = (NSDictionary *)v41;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", urlArrayDictionaryClasses, CFSTR("2"));
  v43 = objc_claimAutoreleasedReturnValue();
  ancestorFrameURLs = v5->_ancestorFrameURLs;
  v5->_ancestorFrameURLs = (NSArray *)v43;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", selectElementInfoClasses, CFSTR("n"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v62 = v45;
    v47 = v45;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v48)
    {
      v49 = v48;
      v50 = 0;
      v51 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v65 != v51)
            objc_enumerationMutation(v47);
          v53 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = objc_msgSend(v53, "integerValue");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v50);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v68[0] = v54;
            v68[1] = v53;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v46, "addObject:", v55);

            ++v50;
          }
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v49);
    }

    v4 = v63;
    p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___WBSCoalescedAsynchronousWriterDelegate + 16);
    v45 = v62;
  }
  else
  {
    v46 = 0;
  }

  selectElementInfo = v5->_selectElementInfo;
  v5->_selectElementInfo = v46;

  v5->_flags.asInteger = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("x"));
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", p_prots[89], CFSTR("7"));
  v57 = objc_claimAutoreleasedReturnValue();
  orderedParts = v5->_orderedParts;
  v5->_orderedParts = (NSArray *)v57;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", p_prots[89], CFSTR("8"));
  v59 = objc_claimAutoreleasedReturnValue();
  classificationHints = v5->_classificationHints;
  v5->_classificationHints = (NSArray *)v59;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *addressBookLabel;
  NSString *associatedUsername;
  NSString *fieldClass;
  NSString *fieldID;
  NSString *fieldName;
  NSString *tagName;
  NSString *uniqueID;
  NSString *nextControlUniqueID;
  NSString *placeholder;
  NSString *value;
  NSString *passwordRules;
  NSString *requiredFormatForDateTimeInput;
  NSString *classification;
  uint64_t size;
  uint64_t maxLength;
  uint64_t minLength;
  uint64_t selectionStart;
  uint64_t selectionLength;
  uint64_t autoFillButtonType;
  uint64_t lastAutoFillButtonType;
  uint64_t continuationID;
  uint64_t continuationIndex;
  NSDictionary *annotations;
  NSArray *autocompleteTokens;
  NSDictionary *radioButtonInfo;
  NSArray *selectElementInfo;
  id v32;
  NSArray *v33;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSArray *ancestorFrameURLs;
  int64_t asInteger;
  NSArray *orderedParts;
  NSArray *classificationHints;
  NSArray *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  addressBookLabel = self->_addressBookLabel;
  if (addressBookLabel)
    objc_msgSend(v4, "encodeObject:forKey:", addressBookLabel, CFSTR("a"));
  associatedUsername = self->_associatedUsername;
  if (associatedUsername)
    objc_msgSend(v5, "encodeObject:forKey:", associatedUsername, CFSTR("d"));
  fieldClass = self->_fieldClass;
  if (fieldClass)
    objc_msgSend(v5, "encodeObject:forKey:", fieldClass, CFSTR("f"));
  fieldID = self->_fieldID;
  if (fieldID)
    objc_msgSend(v5, "encodeObject:forKey:", fieldID, CFSTR("g"));
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(v5, "encodeObject:forKey:", fieldName, CFSTR("h"));
  tagName = self->_tagName;
  if (tagName)
    objc_msgSend(v5, "encodeObject:forKey:", tagName, CFSTR("i"));
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("j"));
  nextControlUniqueID = self->_nextControlUniqueID;
  if (nextControlUniqueID)
    objc_msgSend(v5, "encodeObject:forKey:", nextControlUniqueID, CFSTR("k"));
  placeholder = self->_placeholder;
  if (placeholder)
    objc_msgSend(v5, "encodeObject:forKey:", placeholder, CFSTR("1"));
  value = self->_value;
  if (value)
    objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("l"));
  passwordRules = self->_passwordRules;
  if (passwordRules)
    objc_msgSend(v5, "encodeObject:forKey:", passwordRules, CFSTR("e"));
  requiredFormatForDateTimeInput = self->_requiredFormatForDateTimeInput;
  if (requiredFormatForDateTimeInput)
    objc_msgSend(v5, "encodeObject:forKey:", requiredFormatForDateTimeInput, CFSTR("3"));
  classification = self->_classification;
  if (classification)
    objc_msgSend(v5, "encodeObject:forKey:", classification, CFSTR("4"));
  size = self->_size;
  if ((_DWORD)size)
    objc_msgSend(v5, "encodeInt32:forKey:", size, CFSTR("s"));
  maxLength = self->_maxLength;
  if ((_DWORD)maxLength)
    objc_msgSend(v5, "encodeInt32:forKey:", maxLength, CFSTR("t"));
  minLength = self->_minLength;
  if ((_DWORD)minLength)
    objc_msgSend(v5, "encodeInt32:forKey:", minLength, CFSTR("u"));
  selectionStart = self->_selectionStart;
  if ((_DWORD)selectionStart)
    objc_msgSend(v5, "encodeInt32:forKey:", selectionStart, CFSTR("v"));
  selectionLength = self->_selectionLength;
  if ((_DWORD)selectionLength)
    objc_msgSend(v5, "encodeInt32:forKey:", selectionLength, CFSTR("w"));
  autoFillButtonType = self->_autoFillButtonType;
  if ((_DWORD)autoFillButtonType)
    objc_msgSend(v5, "encodeInt32:forKey:", autoFillButtonType, CFSTR("y"));
  lastAutoFillButtonType = self->_lastAutoFillButtonType;
  if ((_DWORD)lastAutoFillButtonType)
    objc_msgSend(v5, "encodeInt32:forKey:", lastAutoFillButtonType, CFSTR("z"));
  continuationID = self->_continuationID;
  if ((_DWORD)continuationID)
    objc_msgSend(v5, "encodeInt32:forKey:", continuationID, CFSTR("5"));
  continuationIndex = self->_continuationIndex;
  if ((_DWORD)continuationIndex)
    objc_msgSend(v5, "encodeInt32:forKey:", continuationIndex, CFSTR("6"));
  if (self->_rectLeft != 0.0)
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("o"));
  if (self->_rectTop != 0.0)
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("p"));
  if (self->_rectWidth != 0.0)
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("q"));
  if (self->_rectHeight != 0.0)
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("r"));
  annotations = self->_annotations;
  if (annotations)
    objc_msgSend(v5, "encodeObject:forKey:", annotations, CFSTR("b"));
  autocompleteTokens = self->_autocompleteTokens;
  if (autocompleteTokens)
    objc_msgSend(v5, "encodeObject:forKey:", autocompleteTokens, CFSTR("c"));
  radioButtonInfo = self->_radioButtonInfo;
  if (radioButtonInfo)
    objc_msgSend(v5, "encodeObject:forKey:", radioButtonInfo, CFSTR("m"));
  selectElementInfo = self->_selectElementInfo;
  if (selectElementInfo)
  {
    v32 = v5;
    v33 = selectElementInfo;
    if (-[NSArray count](v33, "count"))
    {
      v50 = v32;
      v51 = v5;
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v33, "count"));
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v49 = v33;
      v35 = v33;
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v36)
      {
        v37 = v36;
        v38 = 0;
        v39 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v53 != v39)
              objc_enumerationMutation(v35);
            v41 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "integerValue");
            objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43 != v38)
            {
              objc_msgSend(v34, "addObject:", v42);
              v38 = v43;
            }
            objc_msgSend(v34, "addObject:", v44);
            ++v38;

          }
          v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v37);
      }

      v32 = v50;
      objc_msgSend(v50, "encodeObject:forKey:", v34, CFSTR("n"));

      v5 = v51;
      v33 = v49;
    }

  }
  ancestorFrameURLs = self->_ancestorFrameURLs;
  if (ancestorFrameURLs)
    objc_msgSend(v5, "encodeObject:forKey:", ancestorFrameURLs, CFSTR("2"));
  asInteger = self->_flags.asInteger;
  if (asInteger)
    objc_msgSend(v5, "encodeInteger:forKey:", asInteger, CFSTR("x"));
  orderedParts = self->_orderedParts;
  if (orderedParts)
    objc_msgSend(v5, "encodeObject:forKey:", orderedParts, CFSTR("7"));
  classificationHints = self->_classificationHints;
  if (classificationHints)
    objc_msgSend(v5, "encodeObject:forKey:", classificationHints, CFSTR("8"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WBSFormControlMetadata initWithMetadata:](+[WBSFormControlMetadata allocWithZone:](WBSFormControlMetadata, "allocWithZone:", a3), "initWithMetadata:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[WBSFormControlMetadata initWithMetadata:](+[WBSMutableFormControlMetadata allocWithZone:](WBSMutableFormControlMetadata, "allocWithZone:", a3), "initWithMetadata:", self);
}

- (WBSFormControlMetadata)init
{
  WBSFormControlMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSFormControlMetadata;
  result = -[WBSFormControlMetadata init](&v3, sel_init);
  result->_maxLength = 0x80000;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  WBSFormControlMetadata *v4;
  WBSFormControlMetadata *v5;
  char v6;

  v4 = (WBSFormControlMetadata *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      v5 = v4;
      if (self->_flags.asInteger == v5->_flags.asInteger
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_rectLeft == v5->_rectLeft
        && self->_rectTop == v5->_rectTop
        && self->_rectWidth == v5->_rectWidth
        && self->_rectHeight == v5->_rectHeight
        && self->_size == v5->_size
        && self->_maxLength == v5->_maxLength
        && self->_minLength == v5->_minLength
        && self->_selectionStart == v5->_selectionStart
        && self->_selectionLength == v5->_selectionLength
        && self->_autoFillButtonType == v5->_autoFillButtonType
        && self->_lastAutoFillButtonType == v5->_lastAutoFillButtonType
        && self->_continuationID == v5->_continuationID
        && self->_continuationIndex == v5->_continuationIndex
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual())
      {
        v6 = WBSIsEqual();
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_uniqueID, "hash");
  v4 = -[NSString hash](self->_nextControlUniqueID, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_value, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_flags.asInteger);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (WBSFormControlMetadata)initWithMetadata:(id)a3
{
  id *v4;
  WBSFormControlMetadata *v5;
  WBSFormControlMetadata *v6;

  v4 = (id *)a3;
  v5 = -[WBSFormControlMetadata init](self, "init");
  v6 = v5;
  if (v4)
  {
    objc_storeStrong((id *)&v5->_addressBookLabel, v4[1]);
    objc_storeStrong((id *)&v6->_associatedUsername, v4[2]);
    objc_storeStrong((id *)&v6->_fieldClass, v4[3]);
    objc_storeStrong((id *)&v6->_fieldID, v4[4]);
    objc_storeStrong((id *)&v6->_fieldName, v4[5]);
    objc_storeStrong((id *)&v6->_tagName, v4[6]);
    objc_storeStrong((id *)&v6->_uniqueID, v4[7]);
    objc_storeStrong((id *)&v6->_nextControlUniqueID, v4[8]);
    objc_storeStrong((id *)&v6->_placeholder, v4[9]);
    objc_storeStrong((id *)&v6->_value, v4[10]);
    objc_storeStrong((id *)&v6->_passwordRules, v4[11]);
    objc_storeStrong((id *)&v6->_requiredFormatForDateTimeInput, v4[12]);
    objc_storeStrong((id *)&v6->_classification, v4[13]);
    v6->_size = *((_DWORD *)v4 + 52);
    v6->_maxLength = *((_DWORD *)v4 + 53);
    v6->_minLength = *((_DWORD *)v4 + 54);
    v6->_selectionStart = *((_DWORD *)v4 + 55);
    v6->_selectionLength = *((_DWORD *)v4 + 56);
    v6->_autoFillButtonType = *((_DWORD *)v4 + 57);
    v6->_lastAutoFillButtonType = *((_DWORD *)v4 + 58);
    v6->_continuationID = *((_DWORD *)v4 + 59);
    v6->_continuationIndex = *((_DWORD *)v4 + 60);
    *(_QWORD *)&v6->_rectLeft = v4[21];
    *(_QWORD *)&v6->_rectTop = v4[22];
    *(_QWORD *)&v6->_rectWidth = v4[23];
    *(_QWORD *)&v6->_rectHeight = v4[24];
    objc_storeStrong((id *)&v6->_annotations, v4[15]);
    objc_storeStrong((id *)&v6->_autocompleteTokens, v4[17]);
    objc_storeStrong((id *)&v6->_radioButtonInfo, v4[14]);
    objc_storeStrong((id *)&v6->_selectElementInfo, v4[16]);
    objc_storeStrong((id *)&v6->_ancestorFrameURLs, v4[18]);
    v6->_flags.asInteger = (int64_t)v4[25];
    objc_storeStrong((id *)&v6->_orderedParts, v4[19]);
    objc_storeStrong((id *)&v6->_classificationHints, v4[20]);
  }

  return v6;
}

- (WBSFormControlMetadata)initWithDictionary:(id)a3
{
  id v4;
  WBSFormControlMetadata *v5;
  WBSFormControlMetadata *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WBSFormControlMetadata *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, void *);
  void *v33;
  WBSFormControlMetadata *v34;
  uint64_t v35;

  v4 = a3;
  v5 = -[WBSFormControlMetadata init](self, "init");
  if (objc_msgSend(v4, "count"))
  {
    if (getPropertyMap_onceToken != -1)
      dispatch_once(&getPropertyMap_onceToken, &__block_literal_global_422);
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __45__WBSFormControlMetadata_initWithDictionary___block_invoke;
    v33 = &unk_1E4B397C0;
    v35 = getPropertyMap_map;
    v6 = v5;
    v34 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v30);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall", v30, v31, v32, v33))
    {
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlRectLeft"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v6->_rectLeft = v8;

      objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlRectTop"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v6->_rectTop = v10;

      objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlRectWidth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v6->_rectWidth = v12;

      objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlRectHeight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v6->_rectHeight = v14;

    }
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_size = objc_msgSend(v15, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlMaxLength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    if (v17 > 0x80000 || v17 < 0 || v16 == 0)
      v20 = 0x80000;
    else
      v20 = v17;
    v6->_maxLength = v20;
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlMinLength"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_minLength = objc_msgSend(v21, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SelectionStart"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_selectionStart = objc_msgSend(v22, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SelectionLength"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_selectionLength = objc_msgSend(v23, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlAutoFillButtonType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_autoFillButtonType = objc_msgSend(v24, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlLastAutoFillButtonType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_lastAutoFillButtonType = objc_msgSend(v25, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlContinuationID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_continuationID = objc_msgSend(v26, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ControlContinuationIndex"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_continuationIndex = objc_msgSend(v27, "integerValue");

    v28 = v6;
  }

  return v5;
}

void __45__WBSFormControlMetadata_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  if (v5)
  {
    v6 = v5;
    v7 = v5[1];
    if (v7 == 2)
    {
      ((void (*)(void *))v5[4])(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        object_setIvar(*(id *)(a1 + 32), (Ivar)v6[2], v8);
        v8 = v9;
      }

    }
    else if (v7 == 1)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        object_setIvar(*(id *)(a1 + 32), (Ivar)v6[2], a3);
    }
    else if (!v7 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a3, "BOOLValue"))
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) |= v6[3];
    }
  }
}

- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags;
  NSString *addressBookLabel;
  NSString *associatedUsername;
  NSString *fieldClass;
  NSString *fieldID;
  NSString *fieldName;
  NSString *tagName;
  NSString *uniqueID;
  NSString *nextControlUniqueID;
  NSString *placeholder;
  NSString *value;
  NSString *passwordRules;
  NSString *requiredFormatForDateTimeInput;
  NSString *classification;
  NSDictionary *annotations;
  NSArray *autocompleteTokens;
  NSDictionary *radioButtonInfo;
  NSArray *selectElementInfo;
  NSArray *ancestorFrameURLs;
  NSArray *orderedParts;
  NSArray *classificationHints;
  void *v28;
  void *v29;
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
  void *v41;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DisallowsAutocomplete"));
    flags = self->_flags.flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_105;
    }
  }
  else if ((*(_BYTE *)&flags & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlClaimsToBeCurrentPasswordViaAutocompleteAttribute"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlClaimsToBeNewPasswordViaAutocompleteAttribute"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlClaimsToBeUsernameViaAutocompleteAttribute"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeCreditCardCardholderField"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeCreditCardCompositeExpirationDateField"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeCreditCardNumberField"));
  flags = self->_flags.flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeCreditCardSecurityCodeField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeCreditCardTypeField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeEIDField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeIMEIField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeDayField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeMonthField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeYearField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeIgnoredDataTypeField"));
  flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikePasswordCredentialField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlLooksLikeOneTimeCodeField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("OneTimeCodeIsEligibleForAutomaticLogin"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsVisible"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsActiveElement"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsDisabled"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsReadOnly"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&flags & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsTextField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsSecureTextField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&flags & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsAutoFilledTextField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&flags & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsUserEditedTextField"));
  flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&flags & 0x8000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_129:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsLabeledUsernameField"));
  if ((*(_DWORD *)&self->_flags.flags & 0x8000000) != 0)
LABEL_29:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ControlIsVerticalWritingMode"));
LABEL_30:
  addressBookLabel = self->_addressBookLabel;
  if (addressBookLabel)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", addressBookLabel, CFSTR("AddressBookLabel"));
  associatedUsername = self->_associatedUsername;
  if (associatedUsername)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", associatedUsername, CFSTR("ControlAssociatedUsername"));
  fieldClass = self->_fieldClass;
  if (fieldClass)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", fieldClass, CFSTR("ControlFieldClass"));
  fieldID = self->_fieldID;
  if (fieldID)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", fieldID, CFSTR("ControlFieldID"));
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", fieldName, CFSTR("ControlFieldName"));
  tagName = self->_tagName;
  if (tagName)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", tagName, CFSTR("ControlTagName"));
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", uniqueID, CFSTR("ControlUniqueID"));
  nextControlUniqueID = self->_nextControlUniqueID;
  if (nextControlUniqueID)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", nextControlUniqueID, CFSTR("ControlNextFieldUniqueID"));
  placeholder = self->_placeholder;
  if (placeholder)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", placeholder, CFSTR("ControlPlaceholder"));
  value = self->_value;
  if (value)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", value, CFSTR("ControlValue"));
  passwordRules = self->_passwordRules;
  if (passwordRules)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", passwordRules, CFSTR("ControlPasswordRules"));
  requiredFormatForDateTimeInput = self->_requiredFormatForDateTimeInput;
  if (requiredFormatForDateTimeInput)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", requiredFormatForDateTimeInput, CFSTR("ControlRequiredFormatForDateTimeInput"));
  classification = self->_classification;
  if (classification)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", classification, CFSTR("ControlClassification"));
  annotations = self->_annotations;
  if (annotations)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", annotations, CFSTR("Annotations"));
  autocompleteTokens = self->_autocompleteTokens;
  if (autocompleteTokens)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", autocompleteTokens, CFSTR("AutocompleteTokens"));
  radioButtonInfo = self->_radioButtonInfo;
  if (radioButtonInfo)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", radioButtonInfo, CFSTR("RadioButtonInfo"));
  selectElementInfo = self->_selectElementInfo;
  if (selectElementInfo)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", selectElementInfo, CFSTR("SelectElementInfo"));
  ancestorFrameURLs = self->_ancestorFrameURLs;
  if (ancestorFrameURLs)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", ancestorFrameURLs, CFSTR("AncestorFrameURLs"));
  orderedParts = self->_orderedParts;
  if (orderedParts)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", orderedParts, CFSTR("ControlOrderedParts"));
  classificationHints = self->_classificationHints;
  if (classificationHints)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", classificationHints, CFSTR("ControlClassificationHints"));
  if (self->_rectLeft != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("ControlRectLeft"));

  }
  if (self->_rectTop != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("ControlRectTop"));

  }
  if (self->_rectWidth != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("ControlRectWidth"));

  }
  if (self->_rectHeight != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("ControlRectHeight"));

  }
  if (self->_size)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("ControlSize"));

  }
  if (self->_maxLength)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("ControlMaxLength"));

  }
  if (self->_minLength)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("ControlMinLength"));

  }
  if (self->_selectionStart)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("SelectionStart"));

  }
  if (self->_selectionLength)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("SelectionLength"));

  }
  if (self->_autoFillButtonType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("ControlAutoFillButtonType"));

  }
  if (self->_lastAutoFillButtonType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("ControlLastAutoFillButtonType"));

  }
  if (self->_continuationID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("ControlContinuationID"));

  }
  if (self->_continuationIndex)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("ControlContinuationIndex"));

  }
  if (self->_maxLength == 0x80000)
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ControlMaxLength"));
  if (self->_continuationID && !self->_continuationIndex)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E4B87A48, CFSTR("ControlContinuationIndex"));
    if (!v3)
      goto LABEL_102;
    goto LABEL_101;
  }
  if (v3)
  {
LABEL_101:
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ControlValue"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ControlAssociatedUsername"));
  }
LABEL_102:
  v41 = (void *)objc_msgSend(v6, "copy");

  return v41;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[WBSFormControlMetadata dictionaryRepresentationRedactingSensitiveValues:](self, "dictionaryRepresentationRedactingSensitiveValues:", 0);
}

- (NSData)serializedData
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WBSFormControlMetadata serializedData].cold.1(v4, v3);
  }

  return (NSData *)v2;
}

+ (id)formControlMetadataFromSerializedData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v19;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v13, v3, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v15)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[WBSFormControlMetadata formControlMetadataFromSerializedData:].cold.1(v16, v15);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v14;
LABEL_9:

        goto LABEL_10;
      }
    }
    v17 = 0;
    goto LABEL_9;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (BOOL)disallowsAutocomplete
{
  return *(_DWORD *)&self->_flags.flags & 1;
}

- (BOOL)claimsToBeCurrentPasswordViaAutocompleteAttribute
{
  return (*(_BYTE *)&self->_flags.flags >> 1) & 1;
}

- (BOOL)claimsToBeNewPasswordViaAutocompleteAttribute
{
  return (*(_BYTE *)&self->_flags.flags >> 2) & 1;
}

- (BOOL)claimsToBeUsernameViaAutocompleteAttribute
{
  return (*(_BYTE *)&self->_flags.flags >> 3) & 1;
}

- (BOOL)looksLikeCreditCardCardholderField
{
  return (*(_BYTE *)&self->_flags.flags >> 4) & 1;
}

- (BOOL)looksLikeCreditCardCompositeExpirationDateField
{
  return (*(_BYTE *)&self->_flags.flags >> 5) & 1;
}

- (BOOL)looksLikeCreditCardNumberField
{
  return (*(_BYTE *)&self->_flags.flags >> 6) & 1;
}

- (BOOL)looksLikeCreditCardSecurityCodeField
{
  return *(_BYTE *)&self->_flags.flags >> 7;
}

- (BOOL)looksLikeCreditCardTypeField
{
  return *((_BYTE *)&self->_flags.flags + 1) & 1;
}

- (BOOL)looksLikeEIDField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 1) & 1;
}

- (BOOL)looksLikeIMEIField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 2) & 1;
}

- (BOOL)looksLikeDayField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 3) & 1;
}

- (BOOL)looksLikeMonthField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 4) & 1;
}

- (BOOL)looksLikeYearField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 5) & 1;
}

- (BOOL)looksLikeIgnoredDataTypeField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 6) & 1;
}

- (BOOL)looksLikePasswordCredentialField
{
  return *((unsigned __int8 *)&self->_flags.flags + 1) >> 7;
}

- (BOOL)looksLikeOneTimeCodeField
{
  return BYTE2(self->_flags.asInteger) & 1;
}

- (BOOL)oneTimeCodeIsEligibleForAutomaticLogin
{
  return (BYTE2(self->_flags.asInteger) >> 1) & 1;
}

- (BOOL)isVisible
{
  return (BYTE2(self->_flags.asInteger) >> 2) & 1;
}

- (BOOL)isActive
{
  return (BYTE2(self->_flags.asInteger) >> 3) & 1;
}

- (BOOL)isDisabled
{
  return (BYTE2(self->_flags.asInteger) >> 4) & 1;
}

- (BOOL)isReadOnly
{
  return (BYTE2(self->_flags.asInteger) >> 5) & 1;
}

- (BOOL)isTextField
{
  return (BYTE2(self->_flags.asInteger) >> 6) & 1;
}

- (BOOL)isSecureTextField
{
  return BYTE2(self->_flags.asInteger) >> 7;
}

- (BOOL)isAutoFilledTextField
{
  return BYTE3(self->_flags.asInteger) & 1;
}

- (BOOL)isUserEditedTextField
{
  return (BYTE3(self->_flags.asInteger) >> 1) & 1;
}

- (BOOL)isLabeledUsernameField
{
  return (BYTE3(self->_flags.asInteger) >> 2) & 1;
}

- (BOOL)isVerticalWritingMode
{
  return (BYTE3(self->_flags.asInteger) >> 3) & 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (unint64_t)selectionStart
{
  return self->_selectionStart;
}

- (unint64_t)selectionLength
{
  return self->_selectionLength;
}

- (int64_t)autoFillButtonType
{
  return self->_autoFillButtonType;
}

- (int64_t)lastAutoFillButtonType
{
  return self->_lastAutoFillButtonType;
}

- (unint64_t)continuationID
{
  return self->_continuationID;
}

- (unint64_t)continuationIndex
{
  return self->_continuationIndex;
}

- (int64_t)oneTimeCodeFieldClassification
{
  if (-[NSArray containsObject:](self->_autocompleteTokens, "containsObject:", CFSTR("one-time-code")))
    return 2;
  else
    return ((unint64_t)self->_flags.flags >> 16) & 1;
}

- (CGRect)frame
{
  double rectLeft;
  double rectTop;
  double rectWidth;
  double rectHeight;
  CGRect result;

  rectLeft = self->_rectLeft;
  rectTop = self->_rectTop;
  rectWidth = self->_rectWidth;
  rectHeight = self->_rectHeight;
  result.size.height = rectHeight;
  result.size.width = rectWidth;
  result.origin.y = rectTop;
  result.origin.x = rectLeft;
  return result;
}

- (NSString)addressBookLabel
{
  return self->_addressBookLabel;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (NSArray)autocompleteTokens
{
  return self->_autocompleteTokens;
}

- (NSString)associatedUsername
{
  return self->_associatedUsername;
}

- (NSString)passwordRules
{
  return self->_passwordRules;
}

- (NSString)fieldClass
{
  return self->_fieldClass;
}

- (NSString)fieldID
{
  return self->_fieldID;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)nextControlUniqueID
{
  return self->_nextControlUniqueID;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSString)requiredFormatForDateTimeInput
{
  return self->_requiredFormatForDateTimeInput;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)radioButtonInfo
{
  return self->_radioButtonInfo;
}

- (NSArray)selectElementInfo
{
  return self->_selectElementInfo;
}

- (double)rectLeft
{
  return self->_rectLeft;
}

- (double)rectTop
{
  return self->_rectTop;
}

- (double)rectWidth
{
  return self->_rectWidth;
}

- (double)rectHeight
{
  return self->_rectHeight;
}

- (NSArray)ancestorFrameURLs
{
  return self->_ancestorFrameURLs;
}

- (NSString)classification
{
  return self->_classification;
}

- (NSArray)classificationHints
{
  return self->_classificationHints;
}

- (NSArray)orderedParts
{
  return self->_orderedParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationHints, 0);
  objc_storeStrong((id *)&self->_orderedParts, 0);
  objc_storeStrong((id *)&self->_ancestorFrameURLs, 0);
  objc_storeStrong((id *)&self->_autocompleteTokens, 0);
  objc_storeStrong((id *)&self->_selectElementInfo, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_radioButtonInfo, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_requiredFormatForDateTimeInput, 0);
  objc_storeStrong((id *)&self->_passwordRules, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_nextControlUniqueID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_fieldID, 0);
  objc_storeStrong((id *)&self->_fieldClass, 0);
  objc_storeStrong((id *)&self->_associatedUsername, 0);
  objc_storeStrong((id *)&self->_addressBookLabel, 0);
}

- (void)serializedData
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to archive WBSFormControlMetadata: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)formControlMetadataFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to read from WBSFormControlMetadata data with exception: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
