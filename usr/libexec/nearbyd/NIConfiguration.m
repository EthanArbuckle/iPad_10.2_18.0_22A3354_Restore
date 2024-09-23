@implementation NIConfiguration

- (NIConfiguration)init
{
  __assert_rtn("-[NIConfiguration init]", "NIConfiguration.mm", 341, "NO");
}

+ (NIConfiguration)new
{
  __assert_rtn("+[NIConfiguration new]", "NIConfiguration.mm", 346, "NO");
}

- (id)initInternal
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NIConfiguration;
  result = -[NIConfiguration init](&v3, "init");
  if (result)
  {
    *((int64x2_t *)result + 1) = vdupq_n_s64(3uLL);
    *((_BYTE *)result + 8) = 0;
  }
  return result;
}

- (NIConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NIConfiguration *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v9.receiver = self;
  v9.super_class = (Class)NIConfiguration;
  v6 = -[NIConfiguration init](&v9, "init");
  if (v6)
  {
    v6->_suspensionPolicy = (unint64_t)objc_msgSend(v5, "suspensionPolicy");
    v6->_enabledGestures = (unint64_t)objc_msgSend(v5, "enabledGestures");
    v6->_supportsCameraAssistance = objc_msgSend(v5, "supportsCameraAssistance");
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithConfiguration:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_suspensionPolicy, CFSTR("suspensionPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_enabledGestures, CFSTR("enabledGestures"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsCameraAssistance, CFSTR("supportsCameraAssistance"));

}

- (NIConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NIConfiguration *v6;
  _QWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NIConfiguration *v18;

  v4 = a3;
  v6 = (NIConfiguration *)objc_msgSend(objc_alloc((Class)objc_opt_class(self, v5)), "initInternal");

  if (v6)
  {
    v7 = operator new(0x18uLL);
    *(_OWORD *)v7 = xmmword_10046F030;
    v7[2] = 1;
    v8 = operator new(0x10uLL);
    *v8 = xmmword_10046F020;
    v9 = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suspensionPolicy"));
    v10 = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enabledGestures"));
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCameraAssistance"));
    v12 = 0;
    v13 = 0;
    v6->_suspensionPolicy = 0;
    v6->_enabledGestures = 0;
    v6->_supportsCameraAssistance = v11;
    do
    {
      v14 = v7[v12];
      if ((v14 & v9) != 0)
      {
        v13 |= v14;
        v6->_suspensionPolicy = v13;
      }
      ++v12;
    }
    while (v12 != 3);
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = *(_QWORD *)((char *)v8 + v15);
      if ((v17 & v10) != 0)
      {
        v16 |= v17;
        v6->_enabledGestures = v16;
      }
      v15 += 8;
    }
    while (v15 != 16);
    v18 = v6;
    operator delete(v8);
    operator delete(v7);
  }

  return v6;
}

- (id)descriptionInternal
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return 1;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return self->_supportsCameraAssistance;
}

- (void)setSupportsCameraAssistance:(BOOL)a3
{
  self->_supportsCameraAssistance = a3;
}

- (unint64_t)suspensionPolicy
{
  return self->_suspensionPolicy;
}

- (void)setSuspensionPolicy:(unint64_t)a3
{
  self->_suspensionPolicy = a3;
}

- (unint64_t)enabledGestures
{
  return self->_enabledGestures;
}

- (void)setEnabledGestures:(unint64_t)a3
{
  self->_enabledGestures = a3;
}

@end
