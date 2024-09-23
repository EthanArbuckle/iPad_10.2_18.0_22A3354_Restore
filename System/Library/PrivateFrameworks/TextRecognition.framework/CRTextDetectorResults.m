@implementation CRTextDetectorResults

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

- (NSArray)pyramidPreIntraScaleNMSTextFeatures
{
  return self->_pyramidPreIntraScaleNMSTextFeatures;
}

- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, a3);
}

- (NSArray)pyramidPostIntraScaleNMSTextFeatures
{
  return self->_pyramidPostIntraScaleNMSTextFeatures;
}

- (void)setPyramidPostIntraScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPostIntraScaleNMSTextFeatures, a3);
}

- (NSArray)pyramidPostInterScaleNMSTextFeatures
{
  return self->_pyramidPostInterScaleNMSTextFeatures;
}

- (void)setPyramidPostInterScaleNMSTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidPostInterScaleNMSTextFeatures, a3);
}

- (NSMutableArray)pyramidScaleSize
{
  return self->_pyramidScaleSize;
}

- (void)setPyramidScaleSize:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidScaleSize, a3);
}

- (NSMutableArray)pyramidScaleName
{
  return self->_pyramidScaleName;
}

- (void)setPyramidScaleName:(id)a3
{
  objc_storeStrong((id *)&self->_pyramidScaleName, a3);
}

- (NSArray)detectedTables
{
  return self->_detectedTables;
}

- (void)setDetectedTables:(id)a3
{
  objc_storeStrong((id *)&self->_detectedTables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedTables, 0);
  objc_storeStrong((id *)&self->_pyramidScaleName, 0);
  objc_storeStrong((id *)&self->_pyramidScaleSize, 0);
  objc_storeStrong((id *)&self->_pyramidPostInterScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPostIntraScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_textFeatures, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_inputOptions, 0);
}

@end
