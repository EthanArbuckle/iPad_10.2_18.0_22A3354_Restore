@implementation OSDFeatures

- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6
{
  OSDFeatures *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OSDFeatures;
  result = -[OSDFeatures init](&v11, sel_init);
  if (result)
  {
    result->_silenceFramesCountMs = a3;
    result->_silenceProbability = a4;
    result->_silenceDurationMs = a5;
    result->_processedAudioMs = a6;
  }
  return result;
}

- (OSDFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 processedAudioMs:(double)a6 inferenceTime:(unint64_t)a7
{
  self->_inferenceTime = a7;
  return -[OSDFeatures initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:](self, "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:", a3, a4, a5, a6);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[silenceFramesCountMs = %f]"), *(_QWORD *)&self->_silenceFramesCountMs);
  objc_msgSend(v3, "appendFormat:", CFSTR("[silenceProbability = %f]"), *(_QWORD *)&self->_silenceProbability);
  objc_msgSend(v3, "appendFormat:", CFSTR("[silenceDurationMs = %f]"), *(_QWORD *)&self->_silenceDurationMs);
  objc_msgSend(v3, "appendFormat:", CFSTR("[processedAudioMs = %f]"), *(_QWORD *)&self->_processedAudioMs);
  return v3;
}

- (double)silenceFramesCountMs
{
  return self->_silenceFramesCountMs;
}

- (double)silenceProbability
{
  return self->_silenceProbability;
}

- (double)silenceDurationMs
{
  return self->_silenceDurationMs;
}

- (double)processedAudioMs
{
  return self->_processedAudioMs;
}

- (unint64_t)inferenceTime
{
  return self->_inferenceTime;
}

@end
