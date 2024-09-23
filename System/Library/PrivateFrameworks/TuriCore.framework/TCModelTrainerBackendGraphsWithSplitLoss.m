@implementation TCModelTrainerBackendGraphsWithSplitLoss

- (MLCTrainingGraph)lossGraph
{
  return self->_lossGraph;
}

- (void)setLossGraph:(id)a3
{
  objc_storeStrong((id *)&self->_lossGraph, a3);
}

- (NSDictionary)lossGraphInputs
{
  return self->_lossGraphInputs;
}

- (void)setLossGraphInputs:(id)a3
{
  objc_storeStrong((id *)&self->_lossGraphInputs, a3);
}

- (NSDictionary)lossGraphOutputs
{
  return self->_lossGraphOutputs;
}

- (void)setLossGraphOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_lossGraphOutputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossGraphOutputs, 0);
  objc_storeStrong((id *)&self->_lossGraphInputs, 0);
  objc_storeStrong((id *)&self->_lossGraph, 0);
}

@end
