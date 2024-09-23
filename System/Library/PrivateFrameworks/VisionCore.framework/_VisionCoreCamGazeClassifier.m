@implementation _VisionCoreCamGazeClassifier

- (id)_initWithGazeProbabilitiesOutputDescriptor:(id)a3
{
  id v5;
  _VisionCoreCamGazeClassifier *v6;
  _VisionCoreCamGazeClassifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VisionCoreCamGazeClassifier;
  v6 = -[_VisionCoreCamGazeClassifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gazeProbabilitiesOutputDescriptor, a3);

  return v7;
}

- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreRuntimeUtilities signatureForItem:selector:](VisionCoreRuntimeUtilities, "signatureForItem:selector:", self, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VisionCoreCamGazeNetworkDescriptor.m"), 90, CFSTR("%@ must be implemented"), v9);

  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForFailedOperationWithLocalizedDescription:", CFSTR("could not validate the gaze probabilities data shape"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gazeProbabilitiesOutputDescriptor, 0);
}

+ (_QWORD)classifierForGazeProbabilitiesOutputDescriptor:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dataType") == 65568
    && objc_msgSend(v5, "elementCount") == 3
    && (v6 = (objc_class *)objc_opt_class()) != 0)
  {
    a3 = (_QWORD *)objc_msgSend([v6 alloc], "_initWithGazeProbabilitiesOutputDescriptor:", v4);
  }
  else if (a3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("A gaze probabilties output of %@ is not supported"), v4);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForFailedOperationWithLocalizedDescription:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

@end
