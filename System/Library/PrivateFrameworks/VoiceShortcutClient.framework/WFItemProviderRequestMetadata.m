@implementation WFItemProviderRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)registeredTypeIdentifiers
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override registeredTypeIdentifiers"));
  __break(1u);
  return result;
}

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override fetchLinkMetadataWithCompletion"));
  __break(1u);
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override encodeWithCoder"));
  __break(1u);
}

- (WFItemProviderRequestMetadata)initWithCoder:(id)a3
{
  id v3;
  WFItemProviderRequestMetadata *result;

  v3 = a3;
  result = (WFItemProviderRequestMetadata *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Subclass must override"), CFSTR("Subclasses must override initWithCoder"));
  __break(1u);
  return result;
}

@end
