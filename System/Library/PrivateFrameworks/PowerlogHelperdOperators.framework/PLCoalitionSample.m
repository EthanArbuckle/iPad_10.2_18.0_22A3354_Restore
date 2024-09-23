@implementation PLCoalitionSample

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu inst, %llu r, %llu w, %llu gpuTime, %llu cpuTime, %llu ane, %llu aneTick"), -[PLCoalitionSample instructions](self, "instructions"), -[PLCoalitionSample bytesread](self, "bytesread"), -[PLCoalitionSample byteswritten](self, "byteswritten"), -[PLCoalitionSample gpuTime](self, "gpuTime"), -[PLCoalitionSample cpuTime](self, "cpuTime"), -[PLCoalitionSample aneEnergy](self, "aneEnergy"), -[PLCoalitionSample aneTime](self, "aneTime"));
}

- (unint64_t)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(unint64_t)a3
{
  self->_instructions = a3;
}

- (unint64_t)pInstructions
{
  return self->_pInstructions;
}

- (void)setPInstructions:(unint64_t)a3
{
  self->_pInstructions = a3;
}

- (unint64_t)bytesread
{
  return self->_bytesread;
}

- (void)setBytesread:(unint64_t)a3
{
  self->_bytesread = a3;
}

- (unint64_t)byteswritten
{
  return self->_byteswritten;
}

- (void)setByteswritten:(unint64_t)a3
{
  self->_byteswritten = a3;
}

- (unint64_t)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(unint64_t)a3
{
  self->_gpuTime = a3;
}

- (unint64_t)cpuTime
{
  return self->_cpuTime;
}

- (void)setCpuTime:(unint64_t)a3
{
  self->_cpuTime = a3;
}

- (unint64_t)aneTime
{
  return self->_aneTime;
}

- (void)setAneTime:(unint64_t)a3
{
  self->_aneTime = a3;
}

- (unint64_t)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(unint64_t)a3
{
  self->_aneEnergy = a3;
}

- (unint64_t)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(unint64_t)a3
{
  self->_gpuEnergy = a3;
}

@end
