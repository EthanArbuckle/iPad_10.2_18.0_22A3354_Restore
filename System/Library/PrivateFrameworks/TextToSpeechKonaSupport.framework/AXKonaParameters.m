@implementation AXKonaParameters

- (id)copy
{
  AXKonaParameters *v3;

  v3 = objc_alloc_init(AXKonaParameters);
  -[AXKonaParameters setVocalTract:](v3, "setVocalTract:", -[AXKonaParameters vocalTract](self, "vocalTract"));
  -[AXKonaParameters setHeadSize:](v3, "setHeadSize:", -[AXKonaParameters headSize](self, "headSize"));
  -[AXKonaParameters setPitchBase:](v3, "setPitchBase:", -[AXKonaParameters pitchBase](self, "pitchBase"));
  -[AXKonaParameters setPitchFluctuation:](v3, "setPitchFluctuation:", -[AXKonaParameters pitchFluctuation](self, "pitchFluctuation"));
  -[AXKonaParameters setRoughness:](v3, "setRoughness:", -[AXKonaParameters roughness](self, "roughness"));
  -[AXKonaParameters setBreathiness:](v3, "setBreathiness:", -[AXKonaParameters breathiness](self, "breathiness"));
  -[AXKonaParameters setSpeed:](v3, "setSpeed:", -[AXKonaParameters speed](self, "speed"));
  -[AXKonaParameters setVolume:](v3, "setVolume:", -[AXKonaParameters volume](self, "volume"));
  return v3;
}

- (int64_t)vocalTract
{
  return self->_vocalTract;
}

- (void)setVocalTract:(int64_t)a3
{
  self->_vocalTract = a3;
}

- (int64_t)headSize
{
  return self->_headSize;
}

- (void)setHeadSize:(int64_t)a3
{
  self->_headSize = a3;
}

- (int64_t)pitchBase
{
  return self->_pitchBase;
}

- (void)setPitchBase:(int64_t)a3
{
  self->_pitchBase = a3;
}

- (int64_t)pitchFluctuation
{
  return self->_pitchFluctuation;
}

- (void)setPitchFluctuation:(int64_t)a3
{
  self->_pitchFluctuation = a3;
}

- (int64_t)roughness
{
  return self->_roughness;
}

- (void)setRoughness:(int64_t)a3
{
  self->_roughness = a3;
}

- (int64_t)breathiness
{
  return self->_breathiness;
}

- (void)setBreathiness:(int64_t)a3
{
  self->_breathiness = a3;
}

- (int64_t)speed
{
  return self->_speed;
}

- (void)setSpeed:(int64_t)a3
{
  self->_speed = a3;
}

- (int64_t)volume
{
  return self->_volume;
}

- (void)setVolume:(int64_t)a3
{
  self->_volume = a3;
}

@end
