@implementation SLASRFeatures

- (NSArray)latticePathMaxScores
{
  return self->_latticePathMaxScores;
}

- (void)setLatticePathMaxScores:(id)a3
{
  objc_storeStrong((id *)&self->_latticePathMaxScores, a3);
}

- (NSArray)latticePathMinScores
{
  return self->_latticePathMinScores;
}

- (void)setLatticePathMinScores:(id)a3
{
  objc_storeStrong((id *)&self->_latticePathMinScores, a3);
}

- (NSArray)latticePathMeanScores
{
  return self->_latticePathMeanScores;
}

- (void)setLatticePathMeanScores:(id)a3
{
  objc_storeStrong((id *)&self->_latticePathMeanScores, a3);
}

- (NSArray)latticePathVarScores
{
  return self->_latticePathVarScores;
}

- (void)setLatticePathVarScores:(id)a3
{
  objc_storeStrong((id *)&self->_latticePathVarScores, a3);
}

- (NSArray)topLatticePathScores
{
  return self->_topLatticePathScores;
}

- (void)setTopLatticePathScores:(id)a3
{
  objc_storeStrong((id *)&self->_topLatticePathScores, a3);
}

- (unint64_t)topLatticePathTokenCount
{
  return self->_topLatticePathTokenCount;
}

- (void)setTopLatticePathTokenCount:(unint64_t)a3
{
  self->_topLatticePathTokenCount = a3;
}

- (float)snr
{
  return self->_snr;
}

- (void)setSnr:(float)a3
{
  self->_snr = a3;
}

- (float)trailingSilence
{
  return self->_trailingSilence;
}

- (void)setTrailingSilence:(float)a3
{
  self->_trailingSilence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLatticePathScores, 0);
  objc_storeStrong((id *)&self->_latticePathVarScores, 0);
  objc_storeStrong((id *)&self->_latticePathMeanScores, 0);
  objc_storeStrong((id *)&self->_latticePathMinScores, 0);
  objc_storeStrong((id *)&self->_latticePathMaxScores, 0);
}

@end
