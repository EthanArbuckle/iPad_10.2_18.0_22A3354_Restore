@implementation SXAXCustomRotorDefinition

+ (id)headingsRotor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)headingsRotor_rotorName;
  if (!headingsRotor_rotorName)
  {
    SXBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Headings"), &stru_24D68E0F8, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)headingsRotor_rotorName;
    headingsRotor_rotorName = v2;

    v0 = (void *)headingsRotor_rotorName;
  }
  return v0;
}

+ (id)linksRotor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)linksRotor_rotorName;
  if (!linksRotor_rotorName)
  {
    SXBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Links"), &stru_24D68E0F8, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)linksRotor_rotorName;
    linksRotor_rotorName = v2;

    v0 = (void *)linksRotor_rotorName;
  }
  return v0;
}

+ (id)imagesRotor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)imagesRotor_rotorName;
  if (!imagesRotor_rotorName)
  {
    SXBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Images"), &stru_24D68E0F8, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)imagesRotor_rotorName;
    imagesRotor_rotorName = v2;

    v0 = (void *)imagesRotor_rotorName;
  }
  return v0;
}

+ (id)audioVideoRotor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)audioVideoRotor_rotorName;
  if (!audioVideoRotor_rotorName)
  {
    SXBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Audio/Video"), &stru_24D68E0F8, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)audioVideoRotor_rotorName;
    audioVideoRotor_rotorName = v2;

    v0 = (void *)audioVideoRotor_rotorName;
  }
  return v0;
}

@end
