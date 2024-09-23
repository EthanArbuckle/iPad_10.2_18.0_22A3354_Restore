@implementation PRPosterSuggestionMetadata

- (PRPosterSuggestionMetadata)initWithSuggestedGalleryItem:(id)a3 suggestedComplicationsByIdentifier:(id)a4 lastModifiedDate:(id)a5
{
  id v9;
  id v10;
  PRPosterSuggestionMetadata *v11;
  PRPosterSuggestionMetadata *v12;
  uint64_t v13;
  NSDictionary *suggestedComplicationsByIdentifier;

  v9 = a3;
  v10 = a4;
  v11 = -[PRPosterSuggestionMetadata initWithLastModifiedDate:](self, "initWithLastModifiedDate:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestedGalleryItem, a3);
    v13 = objc_msgSend(v10, "copy");
    suggestedComplicationsByIdentifier = v12->_suggestedComplicationsByIdentifier;
    v12->_suggestedComplicationsByIdentifier = (NSDictionary *)v13;

  }
  return v12;
}

- (PRPosterSuggestionMetadata)initWithLastModifiedDate:(id)a3
{
  id v4;
  PRPosterSuggestionMetadata *v5;
  uint64_t v6;
  NSDate *lastModifiedDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterSuggestionMetadata;
  v5 = -[PRPosterSuggestionMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v6;

  }
  return v5;
}

- (id)metadataBySettingLastModifiedDateToNow
{
  PRPosterSuggestionMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  PRPosterSuggestionMetadata *v7;

  v3 = [PRPosterSuggestionMetadata alloc];
  -[PRPosterSuggestionMetadata suggestedGalleryItem](self, "suggestedGalleryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRPosterSuggestionMetadata initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:](v3, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterSuggestionMetadata *v4;
  void *v5;
  char isKindOfClass;
  PRPosterSuggestionMetadata *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (PRPosterSuggestionMetadata *)a3;
  if (self == v4)
  {
    v31 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterSuggestionMetadata suggestedGalleryItem](self, "suggestedGalleryItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterSuggestionMetadata suggestedGalleryItem](v7, "suggestedGalleryItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ATXFaceGalleryItemEqualObjects(v8, v9);

      if (!v10)
        goto LABEL_16;
      v11 = (void *)MEMORY[0x1E0C99E60];
      -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99E60];
      -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](v7, "suggestedComplicationsByIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = BSEqualObjects();

      if (v19)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allKeys");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v34 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKey:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](v7, "suggestedComplicationsByIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v29) = ATXComplicationEqualObjects((uint64_t)v28, v30);
              if (!(_DWORD)v29)
              {
                v31 = 0;
                goto LABEL_18;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v23)
              continue;
            break;
          }
        }
        v31 = 1;
LABEL_18:

      }
      else
      {
LABEL_16:
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PRPosterSuggestionMetadata suggestedGalleryItem](self, "suggestedGalleryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterSuggestionMetadata *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __41__PRPosterSuggestionMetadata_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __41__PRPosterSuggestionMetadata_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PRPosterSuggestionMetadata suggestedGalleryItem](self, "suggestedGalleryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("suggestedGalleryItem"));

  -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("suggestedComplicationsByIdentifier"));

  -[PRPosterSuggestionMetadata lastModifiedDate](self, "lastModifiedDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lastModifiedDate"));

}

- (PRPosterSuggestionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  PRPosterSuggestionMetadata *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedGalleryItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("suggestedComplicationsByIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C9AA70];
  if (v11)
    v12 = v11;
  v13 = v12;

  v14 = -[PRPosterSuggestionMetadata initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:](self, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", v6, v13, v5);
  return v14;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[PRPosterSuggestionMetadata suggestedGalleryItem](self, "suggestedGalleryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", v4, CFSTR("suggestedGalleryItem"));

  -[PRPosterSuggestionMetadata suggestedComplicationsByIdentifier](self, "suggestedComplicationsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v10, "appendObject:withName:", v6, CFSTR("suggestedComplicationsByIdentifier"));

  -[PRPosterSuggestionMetadata lastModifiedDate](self, "lastModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "appendObject:withName:", v8, CFSTR("lastModifiedDate"));

}

- (ATXFaceGalleryItem)suggestedGalleryItem
{
  return self->_suggestedGalleryItem;
}

- (NSDictionary)suggestedComplicationsByIdentifier
{
  return self->_suggestedComplicationsByIdentifier;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_suggestedComplicationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedGalleryItem, 0);
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeSuggestionMetadata");
}

- (id)encodeJSON
{
  return sub_18B70D344(self, (uint64_t)a2, PRPosterSuggestionMetadata.encodeJSON());
}

+ (id)decodeObjectWithJSON:(id)a3
{
  return sub_18B70E07C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, unint64_t))static PRPosterSuggestionMetadata.decodeObject(withJSON:));
}

@end
