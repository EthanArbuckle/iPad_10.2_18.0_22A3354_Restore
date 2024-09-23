@implementation _UIActivityItemsConfigurationActivityItemProvider

- (_UIActivityItemsConfigurationActivityItemProvider)initWithActivityItemsConfiguration:(id)a3 itemAtSourceIndex:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIActivityItemsConfigurationActivityItemProvider *v12;
  _UIActivityItemsConfigurationActivityItemProvider *v13;
  objc_super v15;

  v7 = a3;
  +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:](_UIActivityItemsConfigurationActivityItemProvider, "metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:", CFSTR("linkPresentationMetadata"), getLPLinkMetadataClass_1(), v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:](_UIActivityItemsConfigurationActivityItemProvider, "metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:", CFSTR("collaborationModeRestrictions"), objc_opt_class(), v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemProvidersForActivityItemsConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)_UIActivityItemsConfigurationActivityItemProvider;
  v12 = -[UIActivityItemProvider initWithPlaceholderItem:](&v15, sel_initWithPlaceholderItem_, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityItemsConfiguration, a3);
    objc_storeStrong(&v13->_item, v11);
    objc_storeStrong((id *)&v13->_linkMetadata, v8);
    objc_storeStrong((id *)&v13->_collaborationModeRestrictions, v9);
    v13->_sourceIndex = a4;
  }

  return v13;
}

- (id)item
{
  return self->_item;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_item;
}

- (id)_title
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[UIActivityItemsConfigurationReading activityItemsConfigurationMetadataForItemAtIndex:key:](self->_activityItemsConfiguration, "activityItemsConfigurationMetadataForItemAtIndex:key:", self->_sourceIndex, *MEMORY[0x1E0DC4710]), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_8;
    }
    -[UIActivityItemsConfigurationReading activityItemsConfigurationMetadataForKey:](self->_activityItemsConfiguration, "activityItemsConfigurationMetadataForKey:", *MEMORY[0x1E0DC4710]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "string");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[_UIActivityItemsConfigurationActivityItemProvider _title](self, "_title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIActivityItemsConfigurationReading activityItemsConfigurationMetadataForKey:](self->_activityItemsConfiguration, "activityItemsConfigurationMetadataForKey:", *MEMORY[0x1E0DC4710]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIActivityItemsConfigurationReading activityItemsConfigurationMetadataForItemAtIndex:key:](self->_activityItemsConfiguration, "activityItemsConfigurationMetadataForItemAtIndex:key:", self->_sourceIndex, *MEMORY[0x1E0DC4710]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "string");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v7 = v8;

  return v7;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  LPLinkMetadata *linkMetadata;
  LPLinkMetadata *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  linkMetadata = self->_linkMetadata;
  if (linkMetadata)
  {
    v4 = linkMetadata;
  }
  else
  {
    v4 = (LPLinkMetadata *)objc_alloc_init(getLPLinkMetadataClass_1());
    -[_UIActivityItemsConfigurationActivityItemProvider _title](self, "_title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](v4, "setTitle:", v6);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIActivityItemsConfigurationReading activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_activityItemsConfiguration, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", self->_sourceIndex, *MEMORY[0x1E0DC4720], 64.0, 64.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata setIconProvider:](v4, "setIconProvider:", v7);

      -[UIActivityItemsConfigurationReading activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_activityItemsConfiguration, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", self->_sourceIndex, *MEMORY[0x1E0DC4718], 512.0, 512.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata setImageProvider:](v4, "setImageProvider:", v8);

    }
    -[LPLinkMetadata title](v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[LPLinkMetadata iconProvider](v4, "iconProvider"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[LPLinkMetadata imageProvider](v4, "imageProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {

        v4 = 0;
      }
    }
  }
  return v4;
}

- (id)activityViewControllerRecipients:(id)a3
{
  return +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:](_UIActivityItemsConfigurationActivityItemProvider, "metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:", CFSTR("recipients"), objc_opt_class(), self->_activityItemsConfiguration, 0);
}

- (id)activityViewControllerShareRecipients:(id)a3
{
  return +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:](_UIActivityItemsConfigurationActivityItemProvider, "metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:", CFSTR("shareRecipients"), objc_opt_class(), self->_activityItemsConfiguration, 0);
}

+ (id)metadataForKey:(id)a3 expectedClass:(Class)a4 activityItemsConfiguration:(id)a5 itemAtSourceIndex:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v9, "activityItemsConfigurationMetadataForItemAtIndex:key:", a6, v8),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "activityItemsConfigurationMetadataForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationModeRestrictions, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_activityItemsConfiguration, 0);
}

@end
