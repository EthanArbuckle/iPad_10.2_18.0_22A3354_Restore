@implementation WFAddToMediaLibraryContextualAction

- (WFAddToMediaLibraryContextualAction)initWithMediaItemDescriptor:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFAddToMediaLibraryContextualAction *v14;
  WFAddToMediaLibraryContextualAction *v15;
  void *v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAddToMediaLibraryContextualAction.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Add %@ to Library"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("Add to Library"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", CFSTR("music.note.list"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.addtoplaylist"), CFSTR("is.workflow.actions.addtoplaylist"), CFSTR("com.apple.Music"), MEMORY[0x1E0C9AA60], v10, v11, v12, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_mediaItemDescriptor, a3);
    v15 = v14;
  }

  return v14;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  -[WFAddToMediaLibraryContextualAction mediaItemDescriptor](self, "mediaItemDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackStoreId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFAddToMediaLibraryContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v9, sel_hash));
  -[WFAddToMediaLibraryContextualAction mediaItemDescriptor](self, "mediaItemDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  v7 = objc_msgSend(v3, "finalize");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFAddToMediaLibraryContextualAction;
  if (-[WFContextualAction isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "mediaItemDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAddToMediaLibraryContextualAction mediaItemDescriptor](self, "mediaItemDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v8 && v9)
          v11 = objc_msgSend(v8, "isEqual:", v9);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WFAddToMediaLibraryContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFAddToMediaLibraryContextualAction *v5;
  void *v6;
  WFAddToMediaLibraryContextualAction *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFAddToMediaLibraryContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaItemDescriptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&v5->_mediaItemDescriptor, v6);
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddToMediaLibraryContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaItemDescriptor, CFSTR("mediaItemDescriptor"), v5.receiver, v5.super_class);

}

- (WFContextualActionMediaItemDescriptor)mediaItemDescriptor
{
  return self->_mediaItemDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemDescriptor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
