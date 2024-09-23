@implementation SUIAShockwaveEdgeLightOverlayConfiguration

void __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_msgSend(v10, "valueForKeyPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKeyPath:", v12, v9);

  objc_msgSend(v10, "delayForApplicationOfKeypath:", v8);
  objc_msgSend(v11, "_setDelay:forApplicationOfKeypath:", v9);
  objc_msgSend(v10, "behaviorSettingsForKeypath:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_setBehaviorSettings:forKeypath:", v13, v9);
}

@end
