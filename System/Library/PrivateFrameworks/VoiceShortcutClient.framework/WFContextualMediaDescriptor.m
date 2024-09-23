@implementation WFContextualMediaDescriptor

- (WFContextualMediaDescriptor)initWithMediaItem:(id)a3 serializedRepresentation:(id)a4
{
  id v7;
  id v8;
  WFContextualMediaDescriptor *v9;
  WFContextualMediaDescriptor *v10;
  WFContextualMediaDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualMediaDescriptor;
  v9 = -[WFContextualMediaDescriptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_serializedRepresentation, a4);
    v11 = v10;
  }

  return v10;
}

- (WFContextualMediaDescriptor)initWithPlayMediaIntent:(id)a3 artwork:(id)a4
{
  id v6;
  id v7;
  WFContextualMediaDescriptor *v8;
  uint64_t v9;
  INPlayMediaIntent *intent;
  WFContextualMediaDescriptor *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualMediaDescriptor;
  v8 = -[WFContextualMediaDescriptor init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    intent = v8->_intent;
    v8->_intent = (INPlayMediaIntent *)v9;

    objc_storeStrong((id *)&v8->_artwork, a4);
    v11 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFContextualMediaDescriptor *v4;
  void *v5;
  void *v6;
  WFContextualMediaDescriptor *v7;

  v4 = [WFContextualMediaDescriptor alloc];
  -[WFContextualMediaDescriptor mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualMediaDescriptor serializedRepresentation](self, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContextualMediaDescriptor initWithMediaItem:serializedRepresentation:](v4, "initWithMediaItem:serializedRepresentation:", v5, v6);

  return v7;
}

- (WFContextualMediaDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFContextualMediaDescriptor *v5;
  uint64_t v6;
  INMediaItem *mediaItem;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  WFPropertyListObject *serializedRepresentation;
  uint64_t v17;
  INPlayMediaIntent *intent;
  uint64_t v19;
  NSData *artwork;
  WFContextualMediaDescriptor *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFContextualMediaDescriptor;
  v5 = -[WFContextualMediaDescriptor init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaItem = v5->_mediaItem;
    v5->_mediaItem = (INMediaItem *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("serializedRepresentation"));
    v15 = objc_claimAutoreleasedReturnValue();
    serializedRepresentation = v5->_serializedRepresentation;
    v5->_serializedRepresentation = (WFPropertyListObject *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v17 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INPlayMediaIntent *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artwork"));
    v19 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (NSData *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFContextualMediaDescriptor mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mediaItem"));

  -[WFContextualMediaDescriptor serializedRepresentation](self, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serializedRepresentation"));

  -[WFContextualMediaDescriptor intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("intent"));

  -[WFContextualMediaDescriptor artwork](self, "artwork");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("artwork"));

}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (NSData)artwork
{
  return self->_artwork;
}

- (INMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (WFPropertyListObject)serializedRepresentation
{
  return self->_serializedRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedRepresentation, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
