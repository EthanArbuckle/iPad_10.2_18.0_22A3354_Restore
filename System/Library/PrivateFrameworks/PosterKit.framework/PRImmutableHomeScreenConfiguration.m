@implementation PRImmutableHomeScreenConfiguration

- (unint64_t)selectedAppearanceType
{
  return self->_selectedAppearanceType;
}

- (id)lockPosterAppearance
{
  return self->_lockPosterAppearance;
}

- (PRImmutableHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PRImmutableHomeScreenConfiguration *v19;
  PRImmutableHomeScreenConfiguration *v20;
  uint64_t v21;
  PRPosterLockPosterHomeScreenAppearance *lockPosterAppearance;
  uint64_t v23;
  PRPosterSolidColorHomeScreenAppearance *solidColorAppearance;
  uint64_t v25;
  PRPosterGradientHomeScreenAppearance *gradientAppearance;
  uint64_t v27;
  PRPosterHomePosterHomeScreenAppearance *homePosterAppearance;
  uint64_t v29;
  PRPosterHomeScreenCustomizationConfiguration *customizationConfiguration;
  objc_super v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v18)
    v18 = (id)objc_opt_new();
  v32.receiver = self;
  v32.super_class = (Class)PRImmutableHomeScreenConfiguration;
  v19 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](&v32, sel_initWithSelectedAppearanceType_lockPosterAppearance_solidColorAppearance_gradientAppearance_homePosterAppearance_customizationConfiguration_, a3, v14, v15, v16, v17, v18);
  v20 = v19;
  if (v19)
  {
    v19->_selectedAppearanceType = a3;
    v21 = objc_msgSend(v14, "copy");
    lockPosterAppearance = v20->_lockPosterAppearance;
    v20->_lockPosterAppearance = (PRPosterLockPosterHomeScreenAppearance *)v21;

    v23 = objc_msgSend(v15, "copy");
    solidColorAppearance = v20->_solidColorAppearance;
    v20->_solidColorAppearance = (PRPosterSolidColorHomeScreenAppearance *)v23;

    v25 = objc_msgSend(v16, "copy");
    gradientAppearance = v20->_gradientAppearance;
    v20->_gradientAppearance = (PRPosterGradientHomeScreenAppearance *)v25;

    v27 = objc_msgSend(v17, "copy");
    homePosterAppearance = v20->_homePosterAppearance;
    v20->_homePosterAppearance = (PRPosterHomePosterHomeScreenAppearance *)v27;

    v29 = objc_msgSend(v18, "copy");
    customizationConfiguration = v20->_customizationConfiguration;
    v20->_customizationConfiguration = (PRPosterHomeScreenCustomizationConfiguration *)v29;

  }
  return v20;
}

- (id)solidColorAppearance
{
  return self->_solidColorAppearance;
}

- (id)gradientAppearance
{
  return self->_gradientAppearance;
}

- (id)homePosterAppearance
{
  return self->_homePosterAppearance;
}

- (id)customizationConfiguration
{
  return self->_customizationConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizationConfiguration, 0);
  objc_storeStrong((id *)&self->_homePosterAppearance, 0);
  objc_storeStrong((id *)&self->_gradientAppearance, 0);
  objc_storeStrong((id *)&self->_solidColorAppearance, 0);
  objc_storeStrong((id *)&self->_lockPosterAppearance, 0);
}

@end
