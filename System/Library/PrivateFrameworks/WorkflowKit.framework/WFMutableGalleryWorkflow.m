@implementation WFMutableGalleryWorkflow

- (void)setIcon:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "backgroundColorValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGalleryWorkflow setIconColor:](self, "setIconColor:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "glyphCharacter");

  objc_msgSend(v7, "numberWithUnsignedShort:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGalleryWorkflow setIconGlyph:](self, "setIconGlyph:", v9);

}

- (CKRecordID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)shortDescription
{
  return self->shortDescription;
}

- (void)setShortDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)longDescription
{
  return self->longDescription;
}

- (void)setLongDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)searchable
{
  return self->searchable;
}

- (void)setSearchable:(id)a3
{
  objc_storeStrong((id *)&self->searchable, a3);
}

- (int64_t)minVersion
{
  return self->minVersion;
}

- (void)setMinVersion:(int64_t)a3
{
  self->minVersion = a3;
}

- (NSArray)hiddenRegions
{
  return self->hiddenRegions;
}

- (void)setHiddenRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)supportedIdioms
{
  return self->supportedIdioms;
}

- (void)setSupportedIdioms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (WFWorkflowRecord)workflowRecord
{
  return self->workflowRecord;
}

- (void)setWorkflowRecord:(id)a3
{
  objc_storeStrong((id *)&self->workflowRecord, a3);
}

- (NSDate)createdAt
{
  return self->createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->createdAt, a3);
}

- (NSDate)modifiedAt
{
  return self->modifiedAt;
}

- (void)setModifiedAt:(id)a3
{
  objc_storeStrong((id *)&self->modifiedAt, a3);
}

- (NSString)language
{
  return self->language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (CKRecordID)base
{
  return self->base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->base, a3);
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (WFFileRepresentation)shortcutFile
{
  return self->shortcutFile;
}

- (void)setShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->shortcutFile, a3);
}

- (WFFileRepresentation)iconFile
{
  return self->iconFile;
}

- (void)setIconFile:(id)a3
{
  objc_storeStrong((id *)&self->iconFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->iconFile, 0);
  objc_storeStrong((id *)&self->shortcutFile, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->modifiedAt, 0);
  objc_storeStrong((id *)&self->createdAt, 0);
  objc_storeStrong((id *)&self->workflowRecord, 0);
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->hiddenRegions, 0);
  objc_storeStrong((id *)&self->searchable, 0);
  objc_storeStrong((id *)&self->longDescription, 0);
  objc_storeStrong((id *)&self->shortDescription, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
