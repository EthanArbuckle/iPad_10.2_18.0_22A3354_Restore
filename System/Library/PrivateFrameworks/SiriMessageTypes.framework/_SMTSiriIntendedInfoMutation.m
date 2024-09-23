@implementation _SMTSiriIntendedInfoMutation

- (_SMTSiriIntendedInfoMutation)initWithBase:(id)a3
{
  id v5;
  _SMTSiriIntendedInfoMutation *v6;
  _SMTSiriIntendedInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTSiriIntendedInfoMutation;
  v6 = -[_SMTSiriIntendedInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (float)getOdldScore
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
    return self->_odldScore;
  -[SMTSiriIntendedInfo odldScore](self->_base, "odldScore");
  return result;
}

- (void)setOdldScore:(float)a3
{
  self->_odldScore = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (float)getAftmScore
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
    return self->_aftmScore;
  -[SMTSiriIntendedInfo aftmScore](self->_base, "aftmScore");
  return result;
}

- (void)setAftmScore:(float)a3
{
  self->_aftmScore = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (float)getSpkrIdScore
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_spkrIdScore;
  -[SMTSiriIntendedInfo spkrIdScore](self->_base, "spkrIdScore");
  return result;
}

- (void)setSpkrIdScore:(float)a3
{
  self->_spkrIdScore = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (float)getLrnnScore
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_lrnnScore;
  -[SMTSiriIntendedInfo lrnnScore](self->_base, "lrnnScore");
  return result;
}

- (void)setLrnnScore:(float)a3
{
  self->_lrnnScore = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (float)getCheckerScore
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_checkerScore;
  -[SMTSiriIntendedInfo checkerScore](self->_base, "checkerScore");
  return result;
}

- (void)setCheckerScore:(float)a3
{
  self->_checkerScore = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getInvocationType
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_invocationType;
  }
  else
  {
    -[SMTSiriIntendedInfo invocationType](self->_base, "invocationType");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInvocationType:(id)a3
{
  objc_storeStrong((id *)&self->_invocationType, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (float)getLrnnThreshold
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_lrnnThreshold;
  -[SMTSiriIntendedInfo lrnnThreshold](self->_base, "lrnnThreshold");
  return result;
}

- (void)setLrnnThreshold:(float)a3
{
  self->_lrnnThreshold = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (float)getLrnnScale
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_lrnnScale;
  -[SMTSiriIntendedInfo lrnnScale](self->_base, "lrnnScale");
  return result;
}

- (void)setLrnnScale:(float)a3
{
  self->_lrnnScale = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (float)getLrnnOffset
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
    return self->_lrnnOffset;
  -[SMTSiriIntendedInfo lrnnOffset](self->_base, "lrnnOffset");
  return result;
}

- (void)setLrnnOffset:(float)a3
{
  self->_lrnnOffset = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getGazeSignal
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
    return self->_isGazeSignalPresent;
  else
    return -[SMTSiriIntendedInfo isGazeSignalPresent](self->_base, "isGazeSignalPresent");
}

- (void)setGazeSignal:(BOOL)a3
{
  self->_isGazeSignalPresent = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
