@implementation PKFelicaSecureElementIsAvailable

void __PKFelicaSecureElementIsAvailable_block_invoke()
{
  PKSecureElement *v0;

  if (qword_1ECF21D68 != -1)
    dispatch_once(&qword_1ECF21D68, &__block_literal_global_457_0);
  byte_1ECF21C83 = byte_1ECF21C7E;
  if (byte_1ECF21C7E)
  {
    v0 = objc_alloc_init(PKSecureElement);
    byte_1ECF21C83 = (-[PKSecureElement supportedTechnologies](v0, "supportedTechnologies") & 4) != 0;

  }
}

@end
