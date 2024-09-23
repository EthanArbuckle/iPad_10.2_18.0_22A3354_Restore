@implementation PLFeatureAvailabilityProgressDelegate

- (PLFeatureAvailabilityProgressDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLFeatureAvailabilityProgressDelegate *v5;
  PLFeatureAvailabilityProgressDelegate *v6;
  PLFeatureAvailabilityProgressDelegate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFeatureAvailabilityProgressDelegate;
  v5 = -[PLFeatureAvailabilityProgressDelegate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lsm, v4);
    v7 = v6;
  }

  return v6;
}

- (void)featureAvailability:(id)a3 updateProgressForFeature:(id)a4
{
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v5 = objc_msgSend(a4, "unsignedIntegerValue", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "analysisCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportBGSTCheckpointProgressForFeature:", v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lsm);
}

@end
