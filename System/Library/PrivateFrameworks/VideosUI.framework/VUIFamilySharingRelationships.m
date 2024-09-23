@implementation VUIFamilySharingRelationships

- (VUIFamilySharingRelationship)season
{
  return self->_season;
}

- (void)setSeason:(id)a3
{
  objc_storeStrong((id *)&self->_season, a3);
}

- (VUIFamilySharingRelationship)show
{
  return self->_show;
}

- (void)setShow:(id)a3
{
  objc_storeStrong((id *)&self->_show, a3);
}

- (VUIFamilySharingPlaybackPositionRelationship)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(id)a3
{
  objc_storeStrong((id *)&self->_playbackPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackPosition, 0);
  objc_storeStrong((id *)&self->_show, 0);
  objc_storeStrong((id *)&self->_season, 0);
}

@end
