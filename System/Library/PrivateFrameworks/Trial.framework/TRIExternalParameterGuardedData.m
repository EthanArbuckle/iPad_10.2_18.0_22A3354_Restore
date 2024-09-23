@implementation TRIExternalParameterGuardedData

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@,Siri device aggregation ID rotation date:%@>"), objc_opt_class(), self->guardedSiriDeviceAggregationIdRotationDate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->guardedSiriDeviceAggregationIdRotationDate, 0);
}

@end
