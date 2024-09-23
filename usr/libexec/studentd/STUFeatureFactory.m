@implementation STUFeatureFactory

+ (id)featureForCRKFeature:(id)a3 enrollmentRecord:(id)a4 configurationManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  STUFeature *v12;
  void *v13;
  void *v14;
  STUFeature *v15;
  void *v16;
  unsigned int v17;
  STUScreenObserveFeature *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomLockDeviceAllowed](CRKRestrictions, "classroomLockDeviceAllowed"));
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  if (v11)
  {
    v12 = [STUFeature alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomLockDeviceAllowed](CRKRestrictions, "classroomLockDeviceAllowed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomUnpromptedAppAndDeviceLockForced](CRKRestrictions, "classroomUnpromptedAppAndDeviceLockForced"));
    v15 = -[STUFeature initWithCRKFeature:enrollmentRecord:forceKey:](v12, "initWithCRKFeature:enrollmentRecord:forceKey:", v13, v8, v14);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed"));
    v17 = objc_msgSend(v7, "isEqualToString:", v16);

    if (v17)
      v18 = -[STUScreenObserveFeature initWithEnrollmentRecord:configurationManager:]([STUScreenObserveFeature alloc], "initWithEnrollmentRecord:configurationManager:", v8, v9);
    else
      v18 = -[STUFeature initWithCRKFeature:enrollmentRecord:]([STUFeature alloc], "initWithCRKFeature:enrollmentRecord:", v7, v8);
    v15 = (STUFeature *)v18;
  }

  return v15;
}

@end
