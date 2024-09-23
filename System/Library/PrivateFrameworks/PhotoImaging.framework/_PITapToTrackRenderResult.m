@implementation _PITapToTrackRenderResult

- (_PITapToTrackRenderResult)initWithCompletedTrack:(id)a3
{
  id v5;
  _PITapToTrackRenderResult *v6;
  _PITapToTrackRenderResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PITapToTrackRenderResult;
  v6 = -[_PITapToTrackRenderResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_completedTrack, a3);

  return v7;
}

- (PTCinematographyTrack)completedTrack
{
  return self->_completedTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTrack, 0);
}

@end
