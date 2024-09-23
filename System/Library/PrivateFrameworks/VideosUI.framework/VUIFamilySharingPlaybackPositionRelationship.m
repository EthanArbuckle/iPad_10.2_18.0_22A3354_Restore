@implementation VUIFamilySharingPlaybackPositionRelationship

- (NSNumber)positionInMilliseconds
{
  return self->_positionInMilliseconds;
}

- (void)setPositionInMilliseconds:(id)a3
{
  objc_storeStrong((id *)&self->_positionInMilliseconds, a3);
}

- (NSDate)recordedAtTimestamp
{
  return self->_recordedAtTimestamp;
}

- (void)setRecordedAtTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_recordedAtTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedAtTimestamp, 0);
  objc_storeStrong((id *)&self->_positionInMilliseconds, 0);
}

@end
