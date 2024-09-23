@implementation SiriCoreConnectionType

- (SiriCoreConnectionType)initWithTechnology:(int64_t)a3
{
  SiriCoreConnectionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriCoreConnectionType;
  result = -[SiriCoreConnectionType init](&v5, sel_init);
  if (result)
    result->_technology = a3;
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SiriCoreConnectionTechnologyGetDescription(self->_technology);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%p %@: technology=%@>"), self, v4, v5);

  return v6;
}

- (int64_t)technology
{
  return self->_technology;
}

- (BOOL)isWWAN
{
  int64_t technology;
  BOOL result;

  technology = self->_technology;
  result = 0;
  if ((unint64_t)(technology - 3000) >= 7 && technology != 1000 && technology != 0)
    return 1;
  return result;
}

- (BOOL)isEdge
{
  int64_t technology;
  BOOL result;

  technology = self->_technology;
  result = 0;
  if ((unint64_t)(technology - 2000) >= 0xF
    && ((unint64_t)(technology - 3000) > 6 || ((1 << (technology + 72)) & 0x65) == 0)
    && technology != 1000
    && technology != 0)
  {
    return 1;
  }
  return result;
}

- (BOOL)canUseWiFiDirectly
{
  int64_t technology;

  technology = self->_technology;
  return (unint64_t)(technology - 2000) >= 0xF && technology != 3005 && technology != 3002;
}

- (int64_t)diagnosticConnectionType
{
  if (-[SiriCoreConnectionType isWWAN](self, "isWWAN"))
    return 2;
  else
    return -[SiriCoreConnectionType technology](self, "technology") == 1000;
}

- (unint64_t)aggregatorConnectionType
{
  int64_t technology;
  unint64_t result;

  technology = self->_technology;
  if ((unint64_t)(technology - 2000) < 0xF)
    return 2;
  switch(technology)
  {
    case 3000:
    case 3006:
      result = 3;
      break;
    case 3001:
      result = 4;
      break;
    case 3002:
      result = 5;
      break;
    case 3003:
      result = 6;
      break;
    case 3004:
      result = 7;
      break;
    case 3005:
      result = 8;
      break;
    default:
      result = technology == 1000;
      break;
  }
  return result;
}

@end
