@implementation SCMLImageAnalysisResult

- (SCMLImageDetectionResult)detectionResult
{
  return self->_detectionResult;
}

- (void)setDetectionResult:(id)a3
{
  objc_storeStrong((id *)&self->_detectionResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
}

@end
