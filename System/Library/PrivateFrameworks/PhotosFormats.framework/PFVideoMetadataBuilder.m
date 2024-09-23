@implementation PFVideoMetadataBuilder

- (id)commonItemForKey:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v7, "setKeySpace:", *MEMORY[0x1E0C8A9D0]);
    objc_msgSend(v7, "setKey:", v5);
    objc_msgSend(v7, "setValue:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)titleItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0C8A8C0];
  -[PFMetadataBuilder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataBuilder commonItemForKey:string:](self, "commonItemForKey:string:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)captionItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0C8A898];
  -[PFMetadataBuilder caption](self, "caption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataBuilder commonItemForKey:string:](self, "commonItemForKey:string:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityDescriptionItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0C8A878];
  -[PFMetadataBuilder accessibilityDescription](self, "accessibilityDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataBuilder commonItemForKey:string:](self, "commonItemForKey:string:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locationItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *MEMORY[0x1E0C8A8A0];
  -[PFMetadataBuilder location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iso6709Notation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataBuilder commonItemForKey:string:](self, "commonItemForKey:string:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)creationDateItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PFMetadataBuilder creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PFVideoMetadataBuilder videoDateFormatter](self, "videoDateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataBuilder creationTimeZone](self, "creationTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v5);

    objc_msgSend(v4, "stringFromDate:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFVideoMetadataBuilder commonItemForKey:string:](self, "commonItemForKey:string:", *MEMORY[0x1E0C8A890], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)videoDateFormatter
{
  if (videoDateFormatter_onceToken != -1)
    dispatch_once(&videoDateFormatter_onceToken, &__block_literal_global_183);
  return (id)videoDateFormatter_dateFormatter;
}

- (id)keywordsItem
{
  void *v2;
  id v3;
  void *v4;

  -[PFMetadataBuilder combinedKeywordsAndPeople](self, "combinedKeywordsAndPeople");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v3, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
    objc_msgSend(v3, "setKey:", *MEMORY[0x1E0C8AAB8]);
    v4 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v3, "setValue:", v4);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)metadataItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataBuilder titleItem](self, "titleItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  -[PFVideoMetadataBuilder captionItem](self, "captionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  -[PFVideoMetadataBuilder locationItem](self, "locationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);

  -[PFVideoMetadataBuilder creationDateItem](self, "creationDateItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);

  -[PFVideoMetadataBuilder keywordsItem](self, "keywordsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "addObject:", v8);

  -[PFVideoMetadataBuilder accessibilityDescriptionItem](self, "accessibilityDescriptionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

uint64_t __44__PFVideoMetadataBuilder_videoDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)videoDateFormatter_dateFormatter;
  videoDateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)videoDateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

@end
