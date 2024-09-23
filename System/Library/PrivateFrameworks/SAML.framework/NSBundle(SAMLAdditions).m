@implementation NSBundle(SAMLAdditions)

+ (id)saml_frameworkBundle
{
  if (saml_frameworkBundle_onceToken != -1)
    dispatch_once(&saml_frameworkBundle_onceToken, &__block_literal_global_0);
  return (id)saml_frameworkBundle_bundle;
}

@end
