@implementation SCROBrailleDisplayManagerStatus

- (NSData)aggregatedData
{
  return self->_aggregatedData;
}

- (void)setAggregatedData:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedData, a3);
}

- (int)virtualAlignment
{
  return self->_virtualAlignment;
}

- (void)setVirtualAlignment:(int)a3
{
  self->_virtualAlignment = a3;
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  self->_masterStatusCellIndex = a3;
}

- (BOOL)currentAnnouncementUnread
{
  return self->_currentAnnouncementUnread;
}

- (void)setCurrentAnnouncementUnread:(BOOL)a3
{
  self->_currentAnnouncementUnread = a3;
}

- (BOOL)anyUnreadAnnouncements
{
  return self->_anyUnreadAnnouncements;
}

- (void)setAnyUnreadAnnouncements:(BOOL)a3
{
  self->_anyUnreadAnnouncements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedData, 0);
}

@end
