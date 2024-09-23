@implementation CLClientManagerAuthorizationContext

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AuthContext InUse:%d  RegResult:%d(%d) EffectiveMask:%d  ProvisionalMask:%d  DiagnosticMask:%d"), self->_inUseLevel, self->_registrationResult, self->_transientAwareRegistrationResult, self->_effectiveServiceMask, self->_provisionalServiceMask, self->_diagnosticMask);
}

- (BOOL)isAuthorizedForServiceType:(unint64_t)a3
{
  return -[CLClientManagerAuthorizationContext isAuthorizedForServiceTypeMask:](self, "isAuthorizedForServiceTypeMask:", 1 << a3);
}

- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3
{
  return (a3 & ~-[CLClientManagerAuthorizationContext effectiveServiceMask](self, "effectiveServiceMask")) == 0;
}

- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[CLClientManagerAuthorizationContext effectiveServiceMask](self, "effectiveServiceMask");
  return (a3 & ~(-[CLClientManagerAuthorizationContext provisionalServiceMask](self, "provisionalServiceMask") | v5)) == 0;
}

- (unint64_t)effectiveServiceMask
{
  return self->_effectiveServiceMask;
}

- (unint64_t)provisionalServiceMask
{
  return self->_provisionalServiceMask;
}

- (BOOL)inUseLevelIsAtLeast:(int)a3
{
  return self->_inUseLevel >= a3;
}

- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3
{
  return -[CLClientManagerAuthorizationContext isNonProvisionallyAuthorizedForServiceTypeMask:](self, "isNonProvisionallyAuthorizedForServiceTypeMask:", 1 << a3);
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
    LOBYTE(v5) = self->_inUseLevel == *((_DWORD *)a3 + 5)
              && self->_staticServiceMask == *((_QWORD *)a3 + 4)
              && self->_effectiveServiceMask == *((_QWORD *)a3 + 5)
              && self->_provisionalServiceMask == *((_QWORD *)a3 + 6)
              && self->_registrationResult == *((_DWORD *)a3 + 4)
              && self->_authorizedForWidgetUpdates == *((unsigned __int8 *)a3 + 8)
              && self->_transientAwareRegistrationResult == *((_DWORD *)a3 + 3)
              && self->_diagnosticMask == *((_QWORD *)a3 + 3);
  return v5;
}

- (int)transientAwareRegistrationResult
{
  return self->_transientAwareRegistrationResult;
}

- (int)registrationResult
{
  return self->_registrationResult;
}

- (BOOL)authorizedForWidgetUpdates
{
  return self->_authorizedForWidgetUpdates;
}

- (int)inUseLevel
{
  return self->_inUseLevel;
}

- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8
{
  unint64_t var1;
  unint64_t var0;
  CLClientManagerAuthorizationContext *result;
  objc_super v15;

  var1 = a6.var1;
  var0 = a6.var0;
  v15.receiver = self;
  v15.super_class = (Class)CLClientManagerAuthorizationContext;
  result = -[CLClientManagerAuthorizationContext init](&v15, "init");
  if (result)
  {
    result->_registrationResult = a4;
    result->_inUseLevel = a3;
    result->_effectiveServiceMask = var0;
    result->_provisionalServiceMask = var1;
    result->_transientAwareRegistrationResult = a5;
    result->_diagnosticMask = a7;
    result->_authorizedForWidgetUpdates = a8;
  }
  return result;
}

- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CLClientManagerAuthorizationContext *v9;
  uint64_t v10;

  v3 = self;
  v4 = *((_QWORD *)self + 5);
  v5 = *((_QWORD *)self + 6);
  v6 = v4 & a3.var0;
  v7 = v5 & a3.var1;
  if ((v4 & a3.var0) != v4 || v7 != v5)
  {
    v9 = [CLClientManagerAuthorizationContext alloc];
    LOBYTE(v10) = v3[8];
    return -[CLClientManagerAuthorizationContext initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:authorizedForWidgetUpdates:](v9, "initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:authorizedForWidgetUpdates:", *((unsigned int *)v3 + 5), *((unsigned int *)v3 + 4), *((unsigned int *)v3 + 3), v6, v7, *((_QWORD *)v3 + 3), v10);
  }
  return self;
}

- (id)getStateSummary
{
  id v3;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_inUseLevel), CFSTR("InUseLevel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_effectiveServiceMask), CFSTR("EffectiveServiceMask"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_provisionalServiceMask), CFSTR("ProvisionalServiceMask"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_registrationResult), CFSTR("RegistrationResult"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_transientAwareRegistrationResult), CFSTR("TransientAwareRegistrationResult"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_diagnosticMask), CFSTR("DiagnosticMask"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_authorizedForWidgetUpdates), CFSTR("AuthorizedForWidgetUpdates"));
  return v3;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

- (unint64_t)staticServiceMask
{
  return self->_staticServiceMask;
}

@end
