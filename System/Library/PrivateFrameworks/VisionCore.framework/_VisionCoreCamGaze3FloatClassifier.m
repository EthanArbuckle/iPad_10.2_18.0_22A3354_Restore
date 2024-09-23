@implementation _VisionCoreCamGaze3FloatClassifier

- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  float *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  int64_t v16;
  void *v19;

  v8 = a4;
  v9 = objc_msgSend(v8, "length");
  v10 = -[VisionCoreTensorDescriptor storageByteCount](self->super._gazeProbabilitiesOutputDescriptor, "storageByteCount");
  if (v9 == v10)
  {
    v11 = (float *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v12 = *v11;
    v13 = v11[1];
    v14 = v11[2];
    v15 = *v11 <= v14 || v12 <= v13;
    v16 = 3;
    if (v15)
      v16 = 0;
    if (v13 > v14 && v13 > v12)
      v16 = 2;
    if (v14 > v13 && v14 > v12)
      v16 = 1;
    *a3 = v16;
  }
  else if (a5)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("the gaze probabilities output data length is %lu, not the expected %lu for %@"), v9, v10, self->super._gazeProbabilitiesOutputDescriptor);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == v10;
}

@end
