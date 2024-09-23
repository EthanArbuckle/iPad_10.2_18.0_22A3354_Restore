@implementation PGGraphPersonRelationshipTagNode

- (PGGraphPersonRelationshipTagNode)initWithPersonRelationshipTag:(unint64_t)a3
{
  PGGraphPersonRelationshipTagNode *v4;
  uint64_t v5;
  NSString *label;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonRelationshipTagNode;
  v4 = -[PGGraphNode init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "labelForRelationshipTag:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    label = v4->_label;
    v4->_label = (NSString *)v5;

  }
  return v4;
}

- (PGGraphPersonRelationshipTagNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "relationshipTagFromString:", v6);

  return -[PGGraphPersonRelationshipTagNode initWithPersonRelationshipTag:](self, "initWithPersonRelationshipTag:", v7);
}

- (unint64_t)tag
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[PGGraphPersonRelationshipTagNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "relationshipTagFromString:", v4);

  return v5;
}

- (unsigned)domain
{
  return 305;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphPersonRelationshipTagNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLabel:domain:", v4, 305);

  return (MANodeFilter *)v5;
}

- (PGGraphPersonRelationshipTagNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPersonRelationshipTagNodeCollection alloc], "initWithNode:", self);
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PGGraphPersonRelationshipTagNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonRelationshipTagNode _localizationKeyForRelationshipTagLabel:](self, "_localizationKeyForRelationshipTagLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_localizationKeyForRelationshipTagLabel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _localizationKeyForRelationshipTagLabel__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_localizationKeyForRelationshipTagLabel__onceToken, &__block_literal_global_32103);
  objc_msgSend((id)_localizationKeyForRelationshipTagLabel__searchKeyByLabel, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)localizedSynonyms
{
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphPersonRelationshipTagNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonRelationshipTagNode _localizationKeyForRelationshipTagLabel:](self, "_localizationKeyForRelationshipTagLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

void __76__PGGraphPersonRelationshipTagNode__localizationKeyForRelationshipTagLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Mother");
  v2[1] = CFSTR("Father");
  v3[0] = CFSTR("PGPersonMotherSearchableText");
  v3[1] = CFSTR("PGPersonFatherSearchableText");
  v2[2] = CFSTR("Parent");
  v2[3] = CFSTR("Child");
  v3[2] = CFSTR("PGPersonParentSearchableText");
  v3[3] = CFSTR("PGPersonChildSearchableText");
  v2[4] = CFSTR("Son");
  v2[5] = CFSTR("Daughter");
  v3[4] = CFSTR("PGPersonSonSearchableText");
  v3[5] = CFSTR("PGPersonDaughterSearchableText");
  v2[6] = CFSTR("Brother");
  v2[7] = CFSTR("Sister");
  v3[6] = CFSTR("PGPersonBrotherSearchableText");
  v3[7] = CFSTR("PGPersonSisterSearchableText");
  v2[8] = CFSTR("Sibling");
  v2[9] = CFSTR("Family");
  v3[8] = CFSTR("PGPersonSiblingSearchableText");
  v3[9] = CFSTR("PGPersonFamilySearchableText");
  v2[10] = CFSTR("Partner");
  v2[11] = CFSTR("Friend");
  v3[10] = CFSTR("PGPersonPartnerSearchableText");
  v3[11] = CFSTR("PGPersonFriendSearchableText");
  v2[12] = CFSTR("Coworker");
  v2[13] = CFSTR("Alumni");
  v3[12] = CFSTR("PGPersonCoworkerSearchableText");
  v3[13] = CFSTR("PGPersonAlumniSearchableText");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localizationKeyForRelationshipTagLabel__searchKeyByLabel;
  _localizationKeyForRelationshipTagLabel__searchKeyByLabel = v0;

}

+ (id)supportedTagsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("Mother");
  v6[1] = CFSTR("Father");
  v6[2] = CFSTR("Parent");
  v6[3] = CFSTR("Child");
  v6[4] = CFSTR("Son");
  v6[5] = CFSTR("Daughter");
  v6[6] = CFSTR("Brother");
  v6[7] = CFSTR("Sister");
  v6[8] = CFSTR("Sibling");
  v6[9] = CFSTR("Family");
  v6[10] = CFSTR("Partner");
  v6[11] = CFSTR("Friend");
  v6[12] = CFSTR("Coworker");
  v6[13] = CFSTR("Alumni");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)relationshipTagFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mother")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Father")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Parent")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Child")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Son")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Daughter")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Brother")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sister")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sibling")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Family")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Partner")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Friend")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Coworker")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Alumni")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)labelForRelationshipTag:(unint64_t)a3
{
  if (a3 > 0xE)
    return CFSTR("Mother");
  else
    return off_1E842D0C8[a3];
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 305);
}

+ (id)filterWithTag:(unint64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "labelForRelationshipTag:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", v3, 305);

  return v4;
}

+ (MARelation)personWithTag
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipTagEdge filter](PGGraphRelationshipTagEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)personWithTagWithConfidence:(double)a3
{
  void *v3;
  void *v4;

  +[PGGraphRelationshipTagEdge filterWithConfidence:](PGGraphRelationshipTagEdge, "filterWithConfidence:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
