@implementation TRICKOpCancelingGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->opsInFlight, 0);
}

@end
