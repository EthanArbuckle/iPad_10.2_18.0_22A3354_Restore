@implementation RVDocumentContext

- (void)setExistingDDResultsList:(id)a3
{
  NSArray *v4;
  NSArray *existingDDResultsList;

  convertResultToObjCInArrayIfNecessary(a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  existingDDResultsList = self->existingDDResultsList;
  self->existingDDResultsList = v4;

}

- (NSArray)existingDDResultsList
{
  return self->existingDDResultsList;
}

- (void)setGroupAllResults:(id)a3
{
  NSArray *v4;
  NSArray *groupAllResults;

  convertResultToObjCInArrayIfNecessary(a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupAllResults = self->groupAllResults;
  self->groupAllResults = v4;

}

- (NSArray)groupAllResults
{
  return self->groupAllResults;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v17;

  v4 = a3;
  -[RVDocumentContext authorName](self, "authorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authorName"));

  -[RVDocumentContext authorEmailAddress](self, "authorEmailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authorEmailAddress"));

  -[RVDocumentContext authorContactUUID](self, "authorContactUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("authorContactUUID"));

  -[RVDocumentContext contentReferenceDate](self, "contentReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contentReferenceDate"));

  -[RVDocumentContext contentReferenceTimeZone](self, "contentReferenceTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("contentReferenceTimeZone"));

  -[RVDocumentContext contentSubject](self, "contentSubject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("contentSubject"));

  -[RVDocumentContext selectedText](self, "selectedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("selectedText"));

  -[RVDocumentContext documentURL](self, "documentURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("documentURL"));

  -[RVDocumentContext existingDDResultsList](self, "existingDDResultsList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("existingDDResultsList"));

  -[RVDocumentContext groupAllResults](self, "groupAllResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("groupAllResults"));

  -[RVDocumentContext groupCategory](self, "groupCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("groupCategory"));

  -[RVDocumentContext groupTranscript](self, "groupTranscript");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("groupTranscript"));

  -[RVDocumentContext coreSpotlightUniqueIdentifier](self, "coreSpotlightUniqueIdentifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("coreSpotlightUniqueIdentifier"));

}

- (RVDocumentContext)initWithCoder:(id)a3
{
  id v4;
  RVDocumentContext *v5;
  uint64_t v6;
  NSString *authorName;
  uint64_t v8;
  NSString *authorEmailAddress;
  uint64_t v10;
  NSString *authorContactUUID;
  uint64_t v12;
  NSDate *contentReferenceDate;
  uint64_t v14;
  NSTimeZone *contentReferenceTimeZone;
  uint64_t v16;
  NSString *contentSubject;
  uint64_t v18;
  NSString *selectedText;
  uint64_t v20;
  NSURL *documentURL;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *existingDDResultsList;
  uint64_t v27;
  NSArray *groupAllResults;
  uint64_t v29;
  NSNumber *groupCategory;
  uint64_t v31;
  NSString *groupTranscript;
  uint64_t v33;
  NSString *coreSpotlightUniqueIdentifier;

  v4 = a3;
  v5 = -[RVDocumentContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorName"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorName = v5->authorName;
    v5->authorName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorEmailAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    authorEmailAddress = v5->authorEmailAddress;
    v5->authorEmailAddress = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorContactUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    authorContactUUID = v5->authorContactUUID;
    v5->authorContactUUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentReferenceDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentReferenceDate = v5->contentReferenceDate;
    v5->contentReferenceDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentReferenceTimeZone"));
    v14 = objc_claimAutoreleasedReturnValue();
    contentReferenceTimeZone = v5->contentReferenceTimeZone;
    v5->contentReferenceTimeZone = (NSTimeZone *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentSubject"));
    v16 = objc_claimAutoreleasedReturnValue();
    contentSubject = v5->contentSubject;
    v5->contentSubject = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedText"));
    v18 = objc_claimAutoreleasedReturnValue();
    selectedText = v5->selectedText;
    v5->selectedText = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    documentURL = v5->documentURL;
    v5->documentURL = (NSURL *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("existingDDResultsList"));
    v25 = objc_claimAutoreleasedReturnValue();
    existingDDResultsList = v5->existingDDResultsList;
    v5->existingDDResultsList = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("groupAllResults"));
    v27 = objc_claimAutoreleasedReturnValue();
    groupAllResults = v5->groupAllResults;
    v5->groupAllResults = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupCategory"));
    v29 = objc_claimAutoreleasedReturnValue();
    groupCategory = v5->groupCategory;
    v5->groupCategory = (NSNumber *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupTranscript"));
    v31 = objc_claimAutoreleasedReturnValue();
    groupTranscript = v5->groupTranscript;
    v5->groupTranscript = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreSpotlightUniqueIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    coreSpotlightUniqueIdentifier = v5->coreSpotlightUniqueIdentifier;
    v5->coreSpotlightUniqueIdentifier = (NSString *)v33;

  }
  return v5;
}

- (void)setNameAndEmailWithRawSenderField:(id)a3
{
  id v4;
  uint64_t v5;
  _WORD *v6;
  _WORD *v7;
  _WORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  _WORD *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  NSString *authorEmailAddress;
  NSString **p_authorName;
  NSString *authorName;
  id v25;
  uint64_t v26;
  NSUInteger v27;
  unsigned __int16 *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  int v31;
  int v32;
  BOOL v33;
  int v34;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  unsigned int v43;
  BOOL v44;
  int v46;
  unint64_t v47;
  int v48;
  int v49;
  int v50;
  unint64_t v51;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  id v57;
  void *v58;
  id v59;
  char v60;
  void *v61;
  RVDocumentContext *v62;
  NSString **v63;
  id v64;

  v64 = a3;
  if (!objc_msgSend(v64, "length"))
    goto LABEL_128;
  if (!-[NSString length](self->authorEmailAddress, "length"))
  {
    v62 = self;
    v4 = v64;
    v5 = objc_msgSend(v4, "length");
    v6 = NSZoneMalloc(0, 2 * v5 + 2);
    v7 = v6;
    v8 = v6;
    if (v5 >= 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v60 = 0;
      v12 = 0;
      v13 = 1;
      v8 = v6;
      do
      {
        v14 = objc_msgSend(v4, "characterAtIndex:", v9);
        v15 = v14;
        if (v14 == 92)
        {
          if (v5 <= v10 + 1)
          {
            if ((v12 & 1) == 0)
            {
              if (v11 < 1)
                goto LABEL_20;
LABEL_17:
              v12 = 0;
              v11 -= v14 == 41;
              goto LABEL_26;
            }
LABEL_12:
            *v8++ = v14;
            v12 &= v14 != 34;
            goto LABEL_26;
          }
          *v8 = 92;
          v8[1] = objc_msgSend(v4, "characterAtIndex:", v10 + 1);
          v8 += 2;
          ++v10;
        }
        else
        {
          if ((v12 & 1) != 0)
            goto LABEL_12;
          if (v14 == 40)
          {
            v12 = 0;
            ++v11;
          }
          else
          {
            if (v11 > 0)
              goto LABEL_17;
            if (v14 != 60)
            {
              if ((v60 & (v14 == 62)) != 0)
                break;
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_21:
                  v12 = 0;
                  if ((v13 & 1) == 0)
                    *v8++ = 32;
                  v13 = 1;
                  goto LABEL_26;
                }
              }
              else
              {
LABEL_20:
                if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v14 + 60) & 0x4000) != 0)
                  goto LABEL_21;
              }
              v13 = 0;
              *v8++ = v15;
              v12 |= v15 == 34;
              goto LABEL_26;
            }
            v12 = 0;
            v60 = 1;
            v8 = v7;
          }
        }
LABEL_26:
        v9 = ++v10;
      }
      while (v5 > v10);
    }
    v16 = MEMORY[0x1E0C80978];
    self = v62;
    while (1)
    {
      v17 = v8;
      v18 = (char *)v8 - (char *)v7;
      if (v8 <= v7)
        break;
      --v8;
      v19 = (unsigned __int16)*(v17 - 1);
      if (v19 > 0x7F)
      {
        if (!__maskrune(v19, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v16 + 4 * v19 + 60) & 0x4000) == 0)
      {
        break;
      }
    }
    *v17 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v7, v18 >> 1);
    NSZoneFree(0, v7);

    if (objc_msgSend(v20, "containsString:", CFSTR("@"))
      && (unint64_t)objc_msgSend(v20, "length") >= 3)
    {
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1EA9078C0);
      v21 = objc_claimAutoreleasedReturnValue();
      authorEmailAddress = v62->authorEmailAddress;
      v62->authorEmailAddress = (NSString *)v21;

    }
  }
  authorName = self->authorName;
  p_authorName = &self->authorName;
  if (-[NSString length](authorName, "length"))
    goto LABEL_128;
  v25 = v64;
  v26 = objc_msgSend(v25, "length");
  v27 = 2 * v26 + 2;
  v28 = (unsigned __int16 *)NSZoneMalloc(0, v27);
  v29 = (unsigned __int16 *)NSZoneMalloc(0, v27);
  objc_msgSend(v25, "getCharacters:", v29);
  v61 = v25;
  if (v26 < 1)
  {
    LOBYTE(v38) = 0;
    v39 = 0;
    goto LABEL_100;
  }
  v63 = p_authorName;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 1;
  while (1)
  {
    v34 = v29[v30];
    if (v34 != 34 || v32 != 0)
      break;
    v32 = 0;
    v31 ^= 1u;
LABEL_53:
    v33 = v26 > ++v30;
    if (v26 == v30)
      goto LABEL_54;
  }
  if (!((v34 != 40) | v31 & 1))
  {
    v31 = 0;
    ++v32;
    goto LABEL_53;
  }
  if (!((v34 != 41) | v31 & 1))
  {
    v31 = 0;
    --v32;
    goto LABEL_53;
  }
  if (v34 != 60 || ((v31 ^ 1) & 1) == 0 || v32)
    goto LABEL_53;
LABEL_54:
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = v29;
  v42 = v28;
  do
  {
    v43 = *v41;
    if (v43 != 92)
    {
      v44 = v39 == 0;
      if (v43 == 34 && v39 == 0)
      {
        v39 = 0;
        v38 ^= 1u;
      }
      else
      {
        if ((v43 != 41) | v38 & 1)
          goto LABEL_63;
        v38 = 0;
        --v39;
      }
LABEL_71:
      if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *v41 + 60) & 0x4000) == 0)
        goto LABEL_77;
      goto LABEL_72;
    }
    if (((v41[1] != 0) & ~v36) != 0)
    {
      v36 = 1;
      goto LABEL_89;
    }
    v44 = v39 == 0;
LABEL_63:
    v46 = (v43 == 60) & ~(_BYTE)v38 & v44;
    if (v46)
      v39 = 0;
    v37 |= v46;
    if (v43 <= 0x7F)
      goto LABEL_71;
    if (!__maskrune(v43, 0x4000uLL))
      goto LABEL_77;
LABEL_72:
    if (!v40)
      goto LABEL_84;
    v47 = *(v42 - 1);
    if (v47 > 0x7F)
    {
      if (__maskrune(v47, 0x4000uLL))
        goto LABEL_84;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v47 + 60) & 0x4000) != 0)
    {
      goto LABEL_84;
    }
LABEL_77:
    v48 = *v41;
    if (v48 != 34 || v39)
    {
      if (v33)
      {
        if ((v37 & 1) != 0)
        {
          v37 = 1;
          goto LABEL_84;
        }
      }
      else if (v39 < 1)
      {
        goto LABEL_84;
      }
      ++v40;
      *v42 = v48;
    }
LABEL_84:
    v49 = *v41;
    if ((v49 != 40) | v38 & 1)
    {
      v36 = 0;
      v50 = (v49 != 62) | v38 | (v39 != 0);
      if ((v50 & 1) == 0)
        v39 = 0;
      v37 &= v50;
    }
    else
    {
      v38 = 0;
      v36 = 0;
      ++v39;
    }
LABEL_89:
    v42 = &v28[v40];
    ++v41;
    --v26;
  }
  while (v26);
  if (v40 < 1)
  {
    p_authorName = v63;
  }
  else
  {
    p_authorName = v63;
    do
    {
      v51 = *(v42 - 1);
      if (v51 > 0x7F)
      {
        if (!__maskrune(v51, 0x4000uLL))
          goto LABEL_102;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v51 + 60) & 0x4000) == 0)
      {
        goto LABEL_102;
      }
      --v42;
    }
    while (v40-- > 1);
LABEL_100:
    v40 = 0;
    v42 = v28;
  }
LABEL_102:
  *v42 = 0;
  if (v39 || (v38 & 1) != 0)
  {
    v55 = v61;
    v57 = v61;
LABEL_114:
    if (v57)
      goto LABEL_121;
LABEL_118:
    if (v42 == v28)
    {
      v57 = 0;
      v42 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v28, v42 - v28);
      v57 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_121;
  }
  v42 = &v28[v40];
  if (v40 < 2)
  {
    v55 = v61;
    goto LABEL_118;
  }
  v53 = 0;
  v54 = v40 + 1;
  v55 = v61;
  while (1)
  {
    v56 = *v28;
    if (v56 != 39)
      break;
    if (*(v42 - 1) != 39)
      goto LABEL_117;
LABEL_111:
    *--v42 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v28 + 1, v54 - 3);
    v57 = (id)objc_claimAutoreleasedReturnValue();

    --v54;
    v53 = v57;
    if (v54 <= 2)
      goto LABEL_114;
  }
  if (v56 == 34 && *(v42 - 1) == 34)
    goto LABEL_111;
LABEL_117:
  v57 = v53;
  if (!v53)
    goto LABEL_118;
LABEL_121:
  NSZoneFree(0, v28);
  NSZoneFree(0, v29);
  if (v42 == v28)
    v58 = v55;
  else
    v58 = v57;
  v59 = v58;

  if (objc_msgSend(v59, "length") && (objc_msgSend(v59, "containsString:", CFSTR("@")) & 1) == 0)
    objc_storeStrong((id *)p_authorName, v58);

LABEL_128:
}

- (NSString)authorName
{
  return self->authorName;
}

- (void)setAuthorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)authorEmailAddress
{
  return self->authorEmailAddress;
}

- (void)setAuthorEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)authorContactUUID
{
  return self->authorContactUUID;
}

- (void)setAuthorContactUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)contentReferenceDate
{
  return self->contentReferenceDate;
}

- (void)setContentReferenceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSTimeZone)contentReferenceTimeZone
{
  return self->contentReferenceTimeZone;
}

- (void)setContentReferenceTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)contentSubject
{
  return self->contentSubject;
}

- (void)setContentSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)selectedText
{
  return self->selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)documentURL
{
  return self->documentURL;
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)coreSpotlightUniqueIdentifier
{
  return self->coreSpotlightUniqueIdentifier;
}

- (void)setCoreSpotlightUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)groupCategory
{
  return self->groupCategory;
}

- (void)setGroupCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)groupTranscript
{
  return self->groupTranscript;
}

- (void)setGroupTranscript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->groupTranscript, 0);
  objc_storeStrong((id *)&self->groupCategory, 0);
  objc_storeStrong((id *)&self->coreSpotlightUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->documentURL, 0);
  objc_storeStrong((id *)&self->selectedText, 0);
  objc_storeStrong((id *)&self->contentSubject, 0);
  objc_storeStrong((id *)&self->contentReferenceTimeZone, 0);
  objc_storeStrong((id *)&self->contentReferenceDate, 0);
  objc_storeStrong((id *)&self->authorContactUUID, 0);
  objc_storeStrong((id *)&self->authorEmailAddress, 0);
  objc_storeStrong((id *)&self->authorName, 0);
  objc_storeStrong((id *)&self->groupAllResults, 0);
  objc_storeStrong((id *)&self->existingDDResultsList, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
