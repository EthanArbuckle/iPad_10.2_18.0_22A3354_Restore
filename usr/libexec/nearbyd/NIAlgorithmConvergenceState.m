@implementation NIAlgorithmConvergenceState

- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3
{
  NIAlgorithmConvergenceState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NIAlgorithmConvergenceState;
  result = -[NIAlgorithmConvergenceState init](&v5, "init");
  if (result)
  {
    result->_convergence = a3;
    *(_DWORD *)&result->_insufficientSignalStrength = 0;
    result->_insufficientLighting = 0;
  }
  return result;
}

- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3
{
  id v4;
  NIAlgorithmConvergenceState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NIAlgorithmConvergenceState;
  v5 = -[NIAlgorithmConvergenceState init](&v7, "init");
  if (v5)
  {
    v5->_convergence = (int64_t)objc_msgSend(v4, "convergence");
    v5->_insufficientSignalStrength = objc_msgSend(v4, "insufficientSignalStrength");
    v5->_insufficientHorizontalSweep = objc_msgSend(v4, "insufficientHorizontalSweep");
    v5->_insufficientVerticalSweep = objc_msgSend(v4, "insufficientVerticalSweep");
    v5->_insufficientMovement = objc_msgSend(v4, "insufficientMovement");
    v5->_insufficientLighting = objc_msgSend(v4, "insufficientLighting");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithAlgorithmConvergenceState:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_convergence, CFSTR("convergence"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientSignalStrength, CFSTR("insufficientSignalStrength"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientHorizontalSweep, CFSTR("insufficientHorizontalSweep"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientVerticalSweep, CFSTR("insufficientVerticalSweep"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientMovement, CFSTR("insufficientMovement"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientLighting, CFSTR("insufficientLighting"));

}

- (NIAlgorithmConvergenceState)initWithCoder:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  NIAlgorithmConvergenceState *v11;
  NIAlgorithmConvergenceState *v12;
  objc_super v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("convergence"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientSignalStrength"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientHorizontalSweep"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientVerticalSweep"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientMovement"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientLighting"));
  v14.receiver = self;
  v14.super_class = (Class)NIAlgorithmConvergenceState;
  v11 = -[NIAlgorithmConvergenceState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_convergence = (int64_t)v5;
    v11->_insufficientSignalStrength = v6;
    v11->_insufficientHorizontalSweep = v7;
    v11->_insufficientVerticalSweep = v8;
    v11->_insufficientMovement = v9;
    v11->_insufficientLighting = v10;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIAlgorithmConvergenceState *v7;
  NIAlgorithmConvergenceState *v8;
  int64_t convergence;
  id v10;
  int insufficientSignalStrength;
  unsigned int v12;
  int insufficientHorizontalSweep;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  int insufficientLighting;
  unsigned int v21;
  int insufficientMovement;
  int insufficientVerticalSweep;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIAlgorithmConvergenceState *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v17 = 1;
    }
    else
    {
      convergence = self->_convergence;
      v10 = -[NIAlgorithmConvergenceState convergence](v7, "convergence");
      insufficientSignalStrength = self->_insufficientSignalStrength;
      v12 = -[NIAlgorithmConvergenceState insufficientSignalStrength](v8, "insufficientSignalStrength");
      insufficientHorizontalSweep = self->_insufficientHorizontalSweep;
      v14 = -[NIAlgorithmConvergenceState insufficientHorizontalSweep](v8, "insufficientHorizontalSweep");
      insufficientVerticalSweep = self->_insufficientVerticalSweep;
      v15 = -[NIAlgorithmConvergenceState insufficientVerticalSweep](v8, "insufficientVerticalSweep");
      insufficientMovement = self->_insufficientMovement;
      v21 = -[NIAlgorithmConvergenceState insufficientMovement](v8, "insufficientMovement");
      insufficientLighting = self->_insufficientLighting;
      v16 = -[NIAlgorithmConvergenceState insufficientLighting](v8, "insufficientLighting");
      v17 = 0;
      if ((id)convergence == v10
        && insufficientSignalStrength == v12
        && insufficientHorizontalSweep == v14
        && insufficientVerticalSweep == v15)
      {
        v17 = insufficientMovement == v21 && insufficientLighting == v16;
      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_convergence));
  v4 = (unint64_t)objc_msgSend(v3, "hash") ^ self->_insufficientSignalStrength ^ (unint64_t)self->_insufficientHorizontalSweep ^ self->_insufficientVerticalSweep ^ self->_insufficientMovement ^ self->_insufficientLighting;

  return v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  unint64_t convergence;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  convergence = self->_convergence;
  if (convergence >= 3)
    __assert_rtn("NIAlgorithmConvergenceStatusToString", "NIAlgorithmConvergenceState.mm", 142, "false");
  objc_msgSend(v8, "appendFormat:", CFSTR(", Convergence: %@"), *(&off_10080E2D0 + convergence));
  if (self->_insufficientSignalStrength)
    v10 = CFSTR("yes");
  else
    v10 = CFSTR("no");
  objc_msgSend(v8, "appendFormat:", CFSTR(", insufficientSignalStrength: %@"), v10);
  if (self->_insufficientHorizontalSweep)
    v11 = CFSTR("yes");
  else
    v11 = CFSTR("no");
  objc_msgSend(v8, "appendFormat:", CFSTR(", insufficientHorizontalSweep: %@"), v11);
  if (self->_insufficientVerticalSweep)
    v12 = CFSTR("yes");
  else
    v12 = CFSTR("no");
  objc_msgSend(v8, "appendFormat:", CFSTR(", insufficientVerticalSweep: %@"), v12);
  if (self->_insufficientMovement)
    v13 = CFSTR("yes");
  else
    v13 = CFSTR("no");
  objc_msgSend(v8, "appendFormat:", CFSTR(", insufficientMovement: %@"), v13);
  if (self->_insufficientLighting)
    v14 = CFSTR("yes");
  else
    v14 = CFSTR("no");
  objc_msgSend(v8, "appendFormat:", CFSTR(", insufficientLighting: %@"), v14);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (int64_t)convergence
{
  return self->_convergence;
}

- (void)setConvergence:(int64_t)a3
{
  self->_convergence = a3;
}

- (BOOL)insufficientSignalStrength
{
  return self->_insufficientSignalStrength;
}

- (void)setInsufficientSignalStrength:(BOOL)a3
{
  self->_insufficientSignalStrength = a3;
}

- (BOOL)insufficientHorizontalSweep
{
  return self->_insufficientHorizontalSweep;
}

- (void)setInsufficientHorizontalSweep:(BOOL)a3
{
  self->_insufficientHorizontalSweep = a3;
}

- (BOOL)insufficientVerticalSweep
{
  return self->_insufficientVerticalSweep;
}

- (void)setInsufficientVerticalSweep:(BOOL)a3
{
  self->_insufficientVerticalSweep = a3;
}

- (BOOL)insufficientMovement
{
  return self->_insufficientMovement;
}

- (void)setInsufficientMovement:(BOOL)a3
{
  self->_insufficientMovement = a3;
}

- (BOOL)insufficientLighting
{
  return self->_insufficientLighting;
}

- (void)setInsufficientLighting:(BOOL)a3
{
  self->_insufficientLighting = a3;
}

@end
