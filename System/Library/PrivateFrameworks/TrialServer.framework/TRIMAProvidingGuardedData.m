@implementation TRIMAProvidingGuardedData

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@,didDefer:%d,deferralHandlerInvalid:%d>"), objc_opt_class(), self->didDeferDuringMADownload, self->deferralHandlerInvalid);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentAsset, 0);
  objc_storeStrong((id *)&self->fetchSemaphores, 0);
}

@end
