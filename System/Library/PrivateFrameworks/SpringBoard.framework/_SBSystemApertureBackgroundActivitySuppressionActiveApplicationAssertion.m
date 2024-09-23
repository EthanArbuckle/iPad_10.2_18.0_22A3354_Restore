@implementation _SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion

- (SBApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
