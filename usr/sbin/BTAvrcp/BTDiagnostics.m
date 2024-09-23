@implementation BTDiagnostics

+ (void)fileABCSnapshot:(id)a3 subTypeContext:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Bluetooth"), CFSTR("Networking"), v8, v7, CFSTR("bluetoothd"), 0));

  objc_msgSend(v10, "snapshotWithSignature:duration:events:payload:actions:reply:", v9, 0, 0, 0, &stru_100018AB8, a5);
}

+ (BOOL)OI_IsInternalDiagnosticsEnabled
{
  return os_variant_has_internal_diagnostics("com.apple.bluetooth", a2);
}

@end
