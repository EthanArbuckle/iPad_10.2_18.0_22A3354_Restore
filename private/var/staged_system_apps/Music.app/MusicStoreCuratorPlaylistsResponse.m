@implementation MusicStoreCuratorPlaylistsResponse

- (BOOL)hasAdditionalPlaylists
{
  return -[NSArray count](self->_additionalPlaylistIdentifiers, "count") != 0;
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setChangeDetails:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetails, a3);
}

- (NSArray)additionalPlaylistIdentifiers
{
  return self->_additionalPlaylistIdentifiers;
}

- (void)setAdditionalPlaylistIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPlaylistIdentifiers, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

@end
