@implementation TMTime

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMTime;
  -[TMTime dealloc](&v3, "dealloc");
}

- (void)setUtc_s:(double)a3
{
  long double v5;
  double __y;

  if (a3 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  if (a3 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  __y = 0.0;
  v5 = modf(a3, &__y);
  -[TMTime setUtc_ns:](self, "setUtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
}

- (void)setRtc_s:(double)a3
{
  long double v5;
  double __y;

  if (a3 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  if (a3 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  __y = 0.0;
  v5 = modf(a3, &__y);
  -[TMTime setRtc_ns:](self, "setRtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
}

- (void)setUtc_ns:(int64_t)a3
{
  self->_utc_ns = a3;
}

- (void)setUtcUnc_s:(double)a3
{
  self->_utcUnc_s = a3;
}

- (void)setSynthesized:(BOOL)a3
{
  self->_synthesized = a3;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSfUnc:(double)a3
{
  self->_sfUnc = a3;
}

- (void)setSf:(double)a3
{
  self->_sf = a3;
}

- (void)setRtc_ns:(int64_t)a3
{
  self->_rtc_ns = a3;
}

- (void)setReliability:(BOOL)a3
{
  self->_reliability = a3;
}

- (TMTime)init
{
  return -[TMTime initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:](self, "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", 0, 0, 0, 0.0, 0.0, 0.0);
}

- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8
{
  TMTime *v14;
  TMTime *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TMTime;
  v14 = -[TMTime init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_rtc_ns = a5;
    v14->_utc_ns = a3;
    v14->_utcUnc_s = a4;
    v14->_sf = a6;
    v14->_sfUnc = a7;
    v14->_source = (NSString *)objc_msgSend(a8, "copy");
    v15->_reliability = 1;
  }
  return v15;
}

- (id)dictionary
{
  _QWORD v4[7];
  _QWORD v5[7];

  v4[0] = CFSTR("TMCurrentTime");
  -[TMTime utc_s](self, "utc_s");
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[1] = CFSTR("TMTimeError");
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[2] = CFSTR("TMRtcTime");
  -[TMTime rtc_s](self, "rtc_s");
  v5[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[3] = CFSTR("TMSource");
  v5[3] = -[TMTime source](self, "source");
  v4[4] = CFSTR("TMScaleFactor");
  -[TMTime sf](self, "sf");
  v5[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[5] = CFSTR("TMScaleFactorError");
  -[TMTime sfUnc](self, "sfUnc");
  v5[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[6] = CFSTR("TMReliability");
  v5[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TMTime reliability](self, "reliability"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 7);
}

- (double)rtc_s
{
  int64_t v2;

  v2 = -[TMTime rtc_ns](self, "rtc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (int64_t)rtc_ns
{
  return self->_rtc_ns;
}

- (double)utcUnc_s
{
  return self->_utcUnc_s;
}

- (double)utc_s
{
  int64_t v2;

  v2 = -[TMTime utc_ns](self, "utc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (int64_t)utc_ns
{
  return self->_utc_ns;
}

- (NSString)source
{
  return self->_source;
}

- (double)sf
{
  return self->_sf;
}

- (double)sfUnc
{
  return self->_sfUnc;
}

- (BOOL)reliability
{
  return self->_reliability;
}

+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7
{
  double v13;
  double v14;
  long double v15;
  double __y;

  if (a3 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  if (a3 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  __y = 0.0;
  v13 = modf(a3, &__y);
  v14 = __y;
  if (a5 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a5);
  if (a5 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a5);
  __y = 0.0;
  v15 = modf(a5, &__y);
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)v14, llround(v15 * 1000000000.0) + 1000000000 * (uint64_t)__y, a7, a4, a6, 0.00002);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", self->_utc_ns, self->_rtc_ns, self->_source, self->_utcUnc_s, self->_sf, self->_sfUnc);
  *((_BYTE *)result + 8) = self->_synthesized;
  *((_BYTE *)result + 9) = self->_reliability;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_rtc_ns, CFSTR("rtc_ns"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_utc_ns, CFSTR("utc_ns"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utcUnc_s"), self->_utcUnc_s);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sf"), self->_sf);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sfUnc"), self->_sfUnc);
  objc_msgSend(a3, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_synthesized, CFSTR("synthesized"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_reliability, CFSTR("reliability"));
}

- (TMTime)initWithCoder:(id)a3
{
  TMTime *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TMTime;
  v4 = -[TMTime init](&v9, "init");
  if (v4)
  {
    v4->_rtc_ns = (int64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rtc_ns"));
    v4->_utc_ns = (int64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("utc_ns"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utcUnc_s"));
    v4->_utcUnc_s = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sf"));
    v4->_sf = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sfUnc"));
    v4->_sfUnc = v7;
    v4->_source = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("source"));
    v4->_synthesized = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("synthesized"));
    v4->_reliability = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("reliability"));
  }
  return v4;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[TMTime utc_s](self, "utc_s");
  v4 = v3;
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v6 = v5;
  -[TMTime rtc_s](self, "rtc_s");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f±%f at %f from '%@'"), v4, v6, v7, -[TMTime source](self, "source"));
}

- (BOOL)isEquivalent:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;

  -[TMTime utc_s](self, "utc_s");
  v6 = v5;
  objc_msgSend(a3, "utc_s");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  if (v6 < v7)
    v7 = v6;
  if (v8 - v7 > 0.000001)
    return 0;
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v10 = v9;
  objc_msgSend(a3, "utcUnc_s");
  if (v10 >= v11)
    v12 = v10;
  else
    v12 = v11;
  if (v10 < v11)
    v11 = v10;
  if (v12 - v11 > 0.000001)
    return 0;
  -[TMTime rtc_s](self, "rtc_s");
  v15 = v14;
  objc_msgSend(a3, "rtc_s");
  if (v15 >= v16)
    v17 = v15;
  else
    v17 = v16;
  if (v15 < v16)
    v16 = v15;
  return v17 - v16 <= 0.000001;
}

- (double)propagatedTimeAtRTC:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[TMTime rtc_s](self, "rtc_s");
  v6 = (a3 - v5) * self->_sf;
  -[TMTime utc_s](self, "utc_s");
  return v7 + v6;
}

- (double)propagatedUncertaintyAtRTC:(double)a3
{
  double v5;

  -[TMTime rtc_s](self, "rtc_s");
  return sub_10000A56C(self->_utcUnc_s, a3 - v5);
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

+ (id)timeWithDictionary:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMScaleFactor"));
  v6 = (void *)objc_opt_class(a1);
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
  v8 = v7;
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
  v10 = v9;
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v12 = v11;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v14 = v13;
  }
  else
  {
    v14 = 1.0;
  }
  return objc_msgSend(v6, "timeWithUtc_s:utcUnc_s:rtc_s:sf:source:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource")), v8, v10, v12, v14);
}

@end
