@implementation TCHumanActionRecognitionTrainerSTGCNOptions

- (TCHumanActionRecognitionTrainerSTGCNOptions)init
{
  TCHumanActionRecognitionTrainerSTGCNOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCHumanActionRecognitionTrainerSTGCNOptions;
  result = -[TCHumanActionRecognitionTrainerSTGCNOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_batchSize = xmmword_2186C4E00;
    *(_OWORD *)&result->_numKeypoints = xmmword_2186C4E10;
    result->_dropoutProbability = 0.1;
  }
  return result;
}

- (void)validate
{
  float v4;
  float v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (-[TCHumanActionRecognitionTrainerSTGCNOptions batchSize](self, "batchSize") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 31, CFSTR("Batch size must be positive"));

  }
  if (-[TCHumanActionRecognitionTrainerSTGCNOptions numFrames](self, "numFrames") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 32, CFSTR("Number of frames must be positive"));

  }
  if (-[TCHumanActionRecognitionTrainerSTGCNOptions numKeypoints](self, "numKeypoints") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 33, CFSTR("Number of keypoints must be positive"));

  }
  if (-[TCHumanActionRecognitionTrainerSTGCNOptions numClasses](self, "numClasses") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 34, CFSTR("Number of classes must be positive"));

  }
  -[TCHumanActionRecognitionTrainerSTGCNOptions dropoutProbability](self, "dropoutProbability");
  if (v4 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 35, CFSTR("Dropout probability must be non-negative"));

  }
  -[TCHumanActionRecognitionTrainerSTGCNOptions dropoutProbability](self, "dropoutProbability");
  if (v5 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TCHumanActionRecognitionTrainer.mm"), 36, CFSTR("Dropout probability must not exceed 1.0"));

  }
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)numFrames
{
  return self->_numFrames;
}

- (void)setNumFrames:(int64_t)a3
{
  self->_numFrames = a3;
}

- (int64_t)numKeypoints
{
  return self->_numKeypoints;
}

- (void)setNumKeypoints:(int64_t)a3
{
  self->_numKeypoints = a3;
}

- (int64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(int64_t)a3
{
  self->_numClasses = a3;
}

- (float)dropoutProbability
{
  return self->_dropoutProbability;
}

- (void)setDropoutProbability:(float)a3
{
  self->_dropoutProbability = a3;
}

@end
