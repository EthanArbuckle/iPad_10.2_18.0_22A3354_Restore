@implementation CSSPURoadInfo

- (CSSPURoadInfo)initWithTimestamp:(unint64_t)a3 distanceToNearestRoad:(double)a4 roadClass:(int)a5 horizontalAccuracy:(float)a6 numRoadFeaturesEvaluated:(int)a7 GEOHandlerErrorDomain:(id)a8 GEOHandlerErrorCode:(int64_t)a9
{
  unsigned __int16 v10;
  unsigned __int8 v12;
  id v16;
  CSSPURoadInfo *v17;
  CSSPURoadInfo *v18;
  objc_super v20;

  v10 = a7;
  v12 = a5;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CSSPURoadInfo;
  v17 = -[CSSPURoadInfo init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    v17->_c_struct.timestamp = a3;
    v17->_c_struct.distanceToNearestRoad = a4;
    v17->_c_struct.roadClass = v12;
    v17->_c_struct.horizontalAccuracy = a6;
    v17->_c_struct.numRoadFeaturesEvaluated = v10;
    strncpy((char *)v17->_c_struct.GEOHandlerErrorDomain, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), 0x40uLL);
    v18->_c_struct.GEOHandlerErrorDomain[63] = 0;
    v18->_c_struct.GEOHandlerErrorCode = a9;
  }

  return v18;
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- ($91562161B5B5ED3166D19FE68F9021FF)c_struct
{
  return ($91562161B5B5ED3166D19FE68F9021FF *)&self->_c_struct;
}

@end
