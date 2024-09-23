@implementation TRICellularParameterGuardedData

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@,bundleId:%@,countryCode:%@>"), objc_opt_class(), self->guardedCarrierBundleIdentifier, self->guardedCarrierCountryIsoCode);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->guardedCarrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->guardedCarrierBundleIdentifier, 0);
}

@end
