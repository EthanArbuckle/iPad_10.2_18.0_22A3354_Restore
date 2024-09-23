@implementation WFEditShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  WFEventSignificantFigureValueTransformer *v2;
  WFEventSignificantFigureValueTransformer *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("actionCount");
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[1] = CFSTR("startingActionCount");
  v7[0] = v2;
  v3 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)numberOfEngagedSuggestions
{
  return self->_numberOfEngagedSuggestions;
}

- (void)setNumberOfEngagedSuggestions:(unsigned int)a3
{
  self->_numberOfEngagedSuggestions = a3;
}

- (unsigned)numberOfManuallyAddedActions
{
  return self->_numberOfManuallyAddedActions;
}

- (void)setNumberOfManuallyAddedActions:(unsigned int)a3
{
  self->_numberOfManuallyAddedActions = a3;
}

- (unsigned)startingActionCount
{
  return self->_startingActionCount;
}

- (void)setStartingActionCount:(unsigned int)a3
{
  self->_startingActionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
