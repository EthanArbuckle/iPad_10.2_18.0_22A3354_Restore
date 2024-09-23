@implementation SFHMACPseudoRandomFunction_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->digestOperation, 0);
}

@end
