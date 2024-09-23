@implementation PTCinematographyTrackAllocator

- (PTCinematographyTrackAllocator)initWithTrackIdentifier:(int64_t)a3
{
  PTCinematographyTrackAllocator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyTrackAllocator;
  result = -[PTCinematographyTrackAllocator init](&v5, sel_init);
  if (result)
    result->_trackIdentifier = a3;
  return result;
}

- (int64_t)nextTrackIdentifier
{
  int64_t trackIdentifier;

  trackIdentifier = self->_trackIdentifier;
  self->_trackIdentifier = trackIdentifier + 1;
  return trackIdentifier;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyTrackAllocator trackIdentifier](self, "trackIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("track_id"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  void *v4;
  void *v5;
  PTCinematographyTrackAllocator *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("track_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    self = -[PTCinematographyTrackAllocator initWithTrackIdentifier:](self, "initWithTrackIdentifier:", objc_msgSend(v4, "integerValue"));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(int64_t)a3
{
  self->_trackIdentifier = a3;
}

@end
