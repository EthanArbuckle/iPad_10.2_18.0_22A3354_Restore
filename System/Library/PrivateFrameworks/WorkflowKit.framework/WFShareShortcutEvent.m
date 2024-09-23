@implementation WFShareShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  WFEventSignificantFigureValueTransformer *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("actionCount");
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (NSString)sharingMode
{
  return self->_sharingMode;
}

- (void)setSharingMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier;
}

- (void)setSharingDestinationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingDestinationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingMode, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
