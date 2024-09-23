@implementation VMULeaksAnalyzer

- (const)analyzerName
{
  return "LEAKS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  VMULeakDetector *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  VMUAnalyzerSummaryField *v9;
  VMUAnalyzerSummaryField *v10;
  VMUAnalyzerSummaryField *v11;
  VMUAnalyzerSummaryField *v12;
  VMUAnalyzerSummaryField *v13;
  id v15;

  v4 = -[VMULeakDetector initWithVMUTask:graph:scanner:stackLogReader:]([VMULeakDetector alloc], "initWithVMUTask:graph:scanner:stackLogReader:", 0, self->super._graph, 0, 0);
  v15 = 0;
  v5 = -[VMULeakDetector detectLeaksWithError:](v4, "detectLeaksWithError:", &v15);
  v6 = v15;
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v9 = [VMUAnalyzerSummaryField alloc];
    if (v5)
    {
      v10 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v9, "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Allocations count"), -[VMULeakDetector allocationsCount](v4, "allocationsCount"), 0, 1);
      objc_msgSend(v8, "addObject:", v10);
      v11 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Allocations size"), -[VMULeakDetector allocationsSize](v4, "allocationsSize"), 0, 2);

      objc_msgSend(v8, "addObject:", v11);
      v12 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Leaks count"), -[VMULeakDetector leakedAllocationsCount](v4, "leakedAllocationsCount"), 0, 1);

      objc_msgSend(v8, "addObject:", v12);
      v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Leaks total size"), -[VMULeakDetector leakedAllocationsSize](v4, "leakedAllocationsSize"), 0, 2);

    }
    else
    {
      v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v9, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisSummaryKey[0], 0, CFSTR("No leaks detected"), 0);
    }
    objc_msgSend(v8, "addObject:", v13);

  }
  return v8;
}

@end
