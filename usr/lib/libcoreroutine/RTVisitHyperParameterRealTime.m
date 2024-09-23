@implementation RTVisitHyperParameterRealTime

- (RTVisitHyperParameterRealTime)init
{
  RTVisitHyperParameterRealTime *v2;
  RTVisitHyperParameterRealTime *v3;
  NSString *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTVisitHyperParameterRealTime;
  v2 = -[RTVisitHyperParameterRealTime init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    uuid = v2->super._uuid;
    v2->super._version = 0;
    v2->super._uuid = (NSString *)CFSTR("a21bbfb6-0419-4389-8d87-a01d27873461");

    v3->super._maxBurstNoiseLength = 2;
    *(_OWORD *)&v3->super._maxHorizontalAccuracy = xmmword_1D1EED660;
    *(_OWORD *)&v3->super._minNoiseToLeftFlankDistance = xmmword_1D1EED670;
    *(_OWORD *)&v3->super._smootherKernelWidth = xmmword_1D1EED680;
    v3->super._maxDistanceBetweenAdjacentPoints = 500;
    v3->super._minSpeedToFilter = 10.0;
    *(_OWORD *)&v3->super._movingWindowSizeForSpeed = xmmword_1D1EECBE0;
    *(_OWORD *)&v3->super._decoderEntryCost = xmmword_1D1EECBF0;
    v3->super._featureDimension = 3;
    *(_OWORD *)&v3->super._featureDistanceMax = xmmword_1D1EECC00;
    *(_OWORD *)&v3->super._featureDwellnessLogMax = xmmword_1D1EECC10;
    v3->super._featurePaddingValue = 1;
    *(_OWORD *)&v3->super._featureRadiusMax = xmmword_1D1EECC20;
    v3->super._maxSequenceLength = 60;
    *(_OWORD *)&v3->super._minEntryProbability = xmmword_1D1EED690;
    v3->super._minInferenceInterval = 300;
    v3->super._minNoVisitProbability = 0.5;
    *(_OWORD *)&v3->super._minSequenceLength = xmmword_1D1EECC30;
    *(_OWORD *)&v3->super._numOfSlide = xmmword_1D1EECC40;
    v3->super._numOfTimeStepForDwellness = 5;
    *(_OWORD *)&v3->super._numOfTimeStepForRadius = xmmword_1D1EECC50;
    *(_OWORD *)&v3->super._onDeviceInferenceBatchSize = xmmword_1D1EECC60;
    *(int64x2_t *)&v3->super._referenceSize = vdupq_n_s64(0xCuLL);
    *(_OWORD *)&v3->super._timeStepInterval = xmmword_1D1EECC70;
    *(_OWORD *)&v3->super._windowInterval = xmmword_1D1EED6A0;
    *(int64x2_t *)&v3->super._binSize = vdupq_n_s64(0xAuLL);
  }
  return v3;
}

@end
