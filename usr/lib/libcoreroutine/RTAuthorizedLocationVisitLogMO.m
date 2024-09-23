@implementation RTAuthorizedLocationVisitLogMO

+ (id)managedObjectWithAuthorizedLocationVisitLog:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTAuthorizedLocationVisitLogMO *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v16 = 0;
    v12 = "Invalid parameter not satisfying: visitLog";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 0;
    v12 = "Invalid parameter not satisfying: managedObjectContext";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  v8 = -[RTAuthorizedLocationVisitLogMO initWithContext:]([RTAuthorizedLocationVisitLogMO alloc], "initWithContext:", v6);
  objc_msgSend(v5, "visitIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAuthorizedLocationVisitLogMO setVisitIdentifier:](v8, "setVisitIdentifier:", v9);

  objc_msgSend(v5, "registrationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAuthorizedLocationVisitLogMO setRegistrationDate:](v8, "setRegistrationDate:", v10);

  -[RTAuthorizedLocationVisitLogMO setLocationTechnologyAvailability:](v8, "setLocationTechnologyAvailability:", objc_msgSend(v5, "locationTechnologyAvailability"));
LABEL_8:

  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTAuthorizedLocationVisitLogMO"));
}

@end
