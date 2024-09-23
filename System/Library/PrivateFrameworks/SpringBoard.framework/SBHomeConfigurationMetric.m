@implementation SBHomeConfigurationMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;

  v6 = a4;
  if (a3 == 58)
  {
    v7 = 16;
  }
  else
  {
    if (a3 != 59)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = 24;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  v8 = 1;
LABEL_7:

  return v8;
}

- (SBHomeConfigurationMetric)init
{
  SBHomeConfigurationMetric *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  PETScalarEventTracker *widgetIconConfigurationPresentationEventTracker;
  uint64_t v7;
  PETScalarEventTracker *widgetIconStackConfigurationPresentationEventTracker;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHomeConfigurationMetric;
  v2 = -[SBHomeConfigurationMetric init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F38]);
    v4 = MEMORY[0x1E0C9AA60];
    v5 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("WidgetIconConfigurationPresented"), MEMORY[0x1E0C9AA60]);
    widgetIconConfigurationPresentationEventTracker = v2->_widgetIconConfigurationPresentationEventTracker;
    v2->_widgetIconConfigurationPresentationEventTracker = (PETScalarEventTracker *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("WidgetIconStackConfigurationPresented"), v4);
    widgetIconStackConfigurationPresentationEventTracker = v2->_widgetIconStackConfigurationPresentationEventTracker;
    v2->_widgetIconStackConfigurationPresentationEventTracker = (PETScalarEventTracker *)v7;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIconStackConfigurationPresentationEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetIconConfigurationPresentationEventTracker, 0);
  objc_storeStrong((id *)&self->_homescreenDensityEventTracker, 0);
}

@end
