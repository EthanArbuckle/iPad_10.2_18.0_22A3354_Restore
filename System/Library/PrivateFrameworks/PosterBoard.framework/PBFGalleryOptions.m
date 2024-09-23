@implementation PBFGalleryOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setModeSemanticTypeToCreate:", self->_modeSemanticTypeToCreate);
  objc_msgSend(v4, "setSuggestedGalleryItem:", self->_suggestedGalleryItem);
  return v4;
}

- (NSNumber)modeSemanticTypeToCreate
{
  return self->_modeSemanticTypeToCreate;
}

- (void)setModeSemanticTypeToCreate:(id)a3
{
  objc_storeStrong((id *)&self->_modeSemanticTypeToCreate, a3);
}

- (NSString)modeSymbolImageName
{
  return self->_modeSymbolImageName;
}

- (void)setModeSymbolImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ATXFaceGalleryItem)suggestedGalleryItem
{
  return self->_suggestedGalleryItem;
}

- (void)setSuggestedGalleryItem:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedGalleryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedGalleryItem, 0);
  objc_storeStrong((id *)&self->_modeSymbolImageName, 0);
  objc_storeStrong((id *)&self->_modeSemanticTypeToCreate, 0);
}

@end
