@implementation WBSCyclerExtensionsTestSuite

- (NSArray)operations
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  WBSCyclerIterationCounter *iterationCounter;
  void (**v5)(id, _QWORD);

  iterationCounter = self->_iterationCounter;
  v5 = (void (**)(id, _QWORD))a4;
  -[WBSCyclerIterationCounter incrementIterationCount](iterationCounter, "incrementIterationCount");
  v5[2](v5, 0);

}

- (WBSCyclerIterationCounter)iterationCounter
{
  return self->_iterationCounter;
}

- (void)setIterationCounter:(id)a3
{
  objc_storeStrong((id *)&self->_iterationCounter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationCounter, 0);
}

@end
