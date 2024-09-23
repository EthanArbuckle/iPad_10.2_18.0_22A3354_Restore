@implementation TCModelTrainerBackendGraphs

- (MLCTrainingGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setTrainingGraph:(id)a3
{
  objc_storeStrong((id *)&self->_trainingGraph, a3);
}

- (NSDictionary)trainingInputs
{
  return self->_trainingInputs;
}

- (void)setTrainingInputs:(id)a3
{
  objc_storeStrong((id *)&self->_trainingInputs, a3);
}

- (NSDictionary)trainingLossLabels
{
  return self->_trainingLossLabels;
}

- (void)setTrainingLossLabels:(id)a3
{
  objc_storeStrong((id *)&self->_trainingLossLabels, a3);
}

- (NSDictionary)trainingLossLabelWeights
{
  return self->_trainingLossLabelWeights;
}

- (void)setTrainingLossLabelWeights:(id)a3
{
  objc_storeStrong((id *)&self->_trainingLossLabelWeights, a3);
}

- (NSDictionary)trainingOutputs
{
  return self->_trainingOutputs;
}

- (void)setTrainingOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_trainingOutputs, a3);
}

- (MLCInferenceGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setInferenceGraph:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceGraph, a3);
}

- (NSDictionary)inferenceInputs
{
  return self->_inferenceInputs;
}

- (void)setInferenceInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceInputs, a3);
}

- (NSDictionary)inferenceOutputs
{
  return self->_inferenceOutputs;
}

- (void)setInferenceOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceOutputs, a3);
}

- (NSDictionary)layerWeights
{
  return self->_layerWeights;
}

- (void)setLayerWeights:(id)a3
{
  objc_storeStrong((id *)&self->_layerWeights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerWeights, 0);
  objc_storeStrong((id *)&self->_inferenceOutputs, 0);
  objc_storeStrong((id *)&self->_inferenceInputs, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingOutputs, 0);
  objc_storeStrong((id *)&self->_trainingLossLabelWeights, 0);
  objc_storeStrong((id *)&self->_trainingLossLabels, 0);
  objc_storeStrong((id *)&self->_trainingInputs, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);
}

@end
