@implementation WBSSiriIntelligenceDonorBookmarkData

- (NSString)coreSpotlightID
{
  return self->_coreSpotlightID;
}

- (void)setCoreSpotlightID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bookmarkURLString
{
  return self->_bookmarkURLString;
}

- (void)setBookmarkURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bookmarkTitle
{
  return self->_bookmarkTitle;
}

- (void)setBookmarkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isReadingListItem
{
  return self->_isReadingListItem;
}

- (void)setIsReadingListItem:(BOOL)a3
{
  self->_isReadingListItem = a3;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_bookmarkTitle, 0);
  objc_storeStrong((id *)&self->_bookmarkURLString, 0);
  objc_storeStrong((id *)&self->_coreSpotlightID, 0);
}

@end
