@implementation TAVisitDetectionMetrics

- (TAVisitDetectionMetrics)initWithDistance:(double)a3 residualDistance:(double)a4 nSigma:(unint64_t)a5
{
  TAVisitDetectionMetrics *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TAVisitDetectionMetrics;
  result = -[TAVisitDetectionMetrics init](&v9, sel_init);
  result->_distanceToPreviousVisit = a3;
  result->_residualDistanceToPreviousVisit = a4;
  result->_nSigmaBetweenVisits = a5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  TAVisitDetectionMetrics *v4;
  TAVisitDetectionMetrics *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  BOOL v13;

  v4 = (TAVisitDetectionMetrics *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TAVisitDetectionMetrics distanceToPreviousVisit](self, "distanceToPreviousVisit");
      v7 = v6;
      -[TAVisitDetectionMetrics distanceToPreviousVisit](v5, "distanceToPreviousVisit");
      if (v7 == v8
        && (-[TAVisitDetectionMetrics residualDistanceToPreviousVisit](self, "residualDistanceToPreviousVisit"),
            v10 = v9,
            -[TAVisitDetectionMetrics residualDistanceToPreviousVisit](v5, "residualDistanceToPreviousVisit"),
            v10 == v11))
      {
        v12 = -[TAVisitDetectionMetrics nSigmaBetweenVisits](self, "nSigmaBetweenVisits");
        v13 = v12 == -[TAVisitDetectionMetrics nSigmaBetweenVisits](v5, "nSigmaBetweenVisits");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitDetectionMetrics)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("VDistancePrevVisit"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("VResidualDistance"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VNSigma"));

  return -[TAVisitDetectionMetrics initWithDistance:residualDistance:nSigma:](self, "initWithDistance:residualDistance:nSigma:", v9, v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double distanceToPreviousVisit;
  id v5;

  distanceToPreviousVisit = self->_distanceToPreviousVisit;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("VDistancePrevVisit"), distanceToPreviousVisit);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("VResidualDistance"), self->_residualDistanceToPreviousVisit);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_nSigmaBetweenVisits, CFSTR("VNSigma"));

}

- (double)distanceToPreviousVisit
{
  return self->_distanceToPreviousVisit;
}

- (double)residualDistanceToPreviousVisit
{
  return self->_residualDistanceToPreviousVisit;
}

- (unint64_t)nSigmaBetweenVisits
{
  return self->_nSigmaBetweenVisits;
}

@end
