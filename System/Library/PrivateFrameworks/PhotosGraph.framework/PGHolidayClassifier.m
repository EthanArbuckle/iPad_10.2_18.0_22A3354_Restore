@implementation PGHolidayClassifier

- (PGHolidayClassifier)init
{
  PGHolidayClassifier *v2;
  PGRemoteConfiguration *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PGHolidayClassifier;
  v2 = -[PGHolidayClassifier init](&v15, sel_init);
  if (v2)
  {
    v3 = -[PGRemoteConfiguration initWithTrialNamespace:onDiskResourceFile:]([PGRemoteConfiguration alloc], "initWithTrialNamespace:onDiskResourceFile:", 5, 0);
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("LocationWeight"), 0.25);
    v2->_locationWeight = v4;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("DateWeight"), 0.15);
    v2->_dateWeight = v5;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("SceneWeight"), 0.6);
    v2->_sceneWeight = v6;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("LocaleLocationWeight"), 0.4);
    v2->_localeLocationWeight = v7;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("MomentLocationWeight"), 0.6);
    v2->_momentLocationWeight = v8;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("EdgeCaseSceneWeight"), 0.3);
    v2->_edgeCaseSceneWeight = v9;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("MediumSceneWeight"), 0.4);
    v2->_mediumSceneWeight = v10;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("ImportantSceneWeight"), 0.6);
    v2->_importantSceneWeight = v11;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("ImperativeSceneWeight"), 1.0);
    v2->_imperativeSceneWeight = v12;
    -[PGRemoteConfiguration doubleValueForKey:withFallbackValue:](v3, "doubleValueForKey:withFallbackValue:", CFSTR("CelebrationThreshold"), 0.8);
    v2->_celebrationThreshold = v13;

  }
  return v2;
}

- (BOOL)isCelebratingForDateScore:(double)a3 sceneScore:(double)a4 locationScore:(double)a5
{
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
    return 0;
  v7 = self->_dateWeight * a3 + self->_locationWeight * a5 + self->_sceneWeight * a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = 134217984;
    v9 = v7;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[HolidayProcessor] celebrationScore: %f", (uint8_t *)&v8, 0xCu);
  }
  return v7 > self->_celebrationThreshold;
}

- (double)scoreForHolidayDetectedScenes:(id)a3
{
  id v4;
  double v5;
  double edgeCaseSceneWeight;
  double v7;
  double v8;
  unint64_t v9;
  double result;

  v4 = a3;
  v5 = (double)(unint64_t)objc_msgSend(v4, "detectedSceneEdgeCaseCount");
  edgeCaseSceneWeight = self->_edgeCaseSceneWeight;
  v7 = self->_mediumSceneWeight * (double)(unint64_t)objc_msgSend(v4, "detectedSceneMediumCount")
     + v5 * edgeCaseSceneWeight;
  v8 = v7 + (double)(unint64_t)objc_msgSend(v4, "detectedSceneImportantCount") * self->_importantSceneWeight;
  v9 = objc_msgSend(v4, "detectedSceneImperativeCount");

  result = v8 + (double)v9 * self->_imperativeSceneWeight;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)PGHolidayClassifier;
  -[PGHolidayClassifier description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("LocationWeight"), *(_QWORD *)&self->_locationWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("DateWeight"), *(_QWORD *)&self->_dateWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("SceneWeight"), *(_QWORD *)&self->_sceneWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("LocaleLocationWeight"), *(_QWORD *)&self->_localeLocationWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("MomentLocationWeight"), *(_QWORD *)&self->_momentLocationWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("EdgeCaseSceneWeight"), *(_QWORD *)&self->_edgeCaseSceneWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("MediumSceneWeight"), *(_QWORD *)&self->_mediumSceneWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("ImportantSceneWeight"), *(_QWORD *)&self->_importantSceneWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("ImperativeSceneWeight"), *(_QWORD *)&self->_imperativeSceneWeight);
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %f\n"), CFSTR("CelebrationThreshold"), *(_QWORD *)&self->_celebrationThreshold);
  return v5;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (double)dateWeight
{
  return self->_dateWeight;
}

- (double)sceneWeight
{
  return self->_sceneWeight;
}

- (double)localeLocationWeight
{
  return self->_localeLocationWeight;
}

- (double)momentLocationWeight
{
  return self->_momentLocationWeight;
}

- (double)edgeCaseSceneWeight
{
  return self->_edgeCaseSceneWeight;
}

- (double)mediumSceneWeight
{
  return self->_mediumSceneWeight;
}

- (double)importantSceneWeight
{
  return self->_importantSceneWeight;
}

- (double)imperativeSceneWeight
{
  return self->_imperativeSceneWeight;
}

- (double)celebrationThreshold
{
  return self->_celebrationThreshold;
}

@end
