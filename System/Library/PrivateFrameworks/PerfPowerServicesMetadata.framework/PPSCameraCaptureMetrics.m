@implementation PPSCameraCaptureMetrics

+ (id)subsystem
{
  return CFSTR("CameraCapture");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cameraInPocketDecision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)cameraInPocketDecision
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSCameraCaptureMetrics subsystem](PPSCameraCaptureMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("InPocketDecision"), v3, CFSTR("PocketDetection"), 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DetectionSessionStartTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DetectionSessionStopTime"), 8, v11, v6, 0, 1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
