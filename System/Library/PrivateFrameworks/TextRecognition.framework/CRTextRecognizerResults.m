@implementation CRTextRecognizerResults

- (NSArray)lineFeatures
{
  void *v2;
  void *v3;

  -[CRTextRecognizerResults textFeatures](self, "textFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRTextResults linesFromTextFeatures:](CRTextResults, "linesFromTextFeatures:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)inputOptions
{
  return self->_inputOptions;
}

- (void)setInputOptions:(id)a3
{
  objc_storeStrong((id *)&self->_inputOptions, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSArray)textFeatures
{
  return self->_textFeatures;
}

- (void)setTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_textFeatures, a3);
}

- (NSArray)codeMaps
{
  return self->_codeMaps;
}

- (void)setCodeMaps:(id)a3
{
  objc_storeStrong((id *)&self->_codeMaps, a3);
}

- (CRLatticeResults)latticeResults
{
  return self->_latticeResults;
}

- (void)setLatticeResults:(id)a3
{
  objc_storeStrong((id *)&self->_latticeResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latticeResults, 0);
  objc_storeStrong((id *)&self->_codeMaps, 0);
  objc_storeStrong((id *)&self->_textFeatures, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_inputOptions, 0);
}

@end
