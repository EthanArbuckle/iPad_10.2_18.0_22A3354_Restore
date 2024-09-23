@implementation TRITelemetryFactory

+ (id)containerOriginTelemetryForTaskAttribution:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRITelemetryFactory.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "teamIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClientTeamId:", v8);

  }
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v5, "triCloudKitContainer");
  if (v10 <= 2)
    objc_msgSend(v9, "setCkContainer:", v10);
  v11 = objc_msgSend(MEMORY[0x1E0DC09C0], "currentEnvironment");
  if (v11 <= 5)
    objc_msgSend(v9, "setCkEnvironment:", dword_1D21DA7C0[v11]);
  objc_msgSend(v6, "setContainerOriginFields:", v9);

  return v6;
}

@end
