@implementation TRITrialSystemTelemetry

- (BOOL)hasClientTeamId
{
  return self->_clientTeamId != 0;
}

- (BOOL)hasClientProjectId
{
  return self->_clientProjectId != 0;
}

- (BOOL)hasExperimentFields
{
  return self->_experimentFields != 0;
}

- (BOOL)hasRolloutFields
{
  return self->_rolloutFields != 0;
}

- (BOOL)hasClientDeploymentEnv
{
  return self->_clientDeploymentEnv != 0;
}

- (BOOL)hasTrialdTaskName
{
  return self->_trialdTaskName != 0;
}

- (BOOL)hasPrevOsBuild
{
  return self->_prevOsBuild != 0;
}

- (BOOL)hasPrevBcp47DeviceLocale
{
  return self->_prevBcp47DeviceLocale != 0;
}

- (BOOL)hasPrevLanguageCode
{
  return self->_prevLanguageCode != 0;
}

- (BOOL)hasPrevRegionCode
{
  return self->_prevRegionCode != 0;
}

- (BOOL)hasClientDeploymentId
{
  return self->_clientDeploymentId != 0;
}

- (BOOL)hasFactorFields
{
  return self->_factorFields != 0;
}

- (BOOL)hasDownloadSettingsFields
{
  return self->_downloadSettingsFields != 0;
}

- (BOOL)hasContainerOriginFields
{
  return self->_containerOriginFields != 0;
}

- (BOOL)hasAssetPurgeFields
{
  return self->_assetPurgeFields != 0;
}

- (BOOL)hasDownloadStatusFields
{
  return self->_downloadStatusFields != 0;
}

- (BOOL)hasOnDemandFactorFields
{
  return self->_onDemandFactorFields != 0;
}

- (BOOL)hasPrevCarrierCountryIsoCode
{
  return self->_prevCarrierCountryIsoCode != 0;
}

- (BOOL)hasPrevCarrierBundleIdentifier
{
  return self->_prevCarrierBundleIdentifier != 0;
}

- (void)setPrevExperimentOptOutStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_prevExperimentOptOutStatus = a3;
}

- (void)setHasPrevExperimentOptOutStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrevExperimentOptOutStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMobileAssetOriginFields
{
  return self->_mobileAssetOriginFields != 0;
}

- (BOOL)hasBmltFields
{
  return self->_bmltFields != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TRITrialSystemTelemetry;
  -[TRITrialSystemTelemetry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialSystemTelemetry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientTeamId;
  NSString *clientProjectId;
  TRITrialExperimentFields *experimentFields;
  void *v8;
  TRITrialRolloutFields *rolloutFields;
  void *v10;
  NSString *clientDeploymentEnv;
  NSString *trialdTaskName;
  NSString *prevOsBuild;
  NSString *prevBcp47DeviceLocale;
  NSString *prevLanguageCode;
  NSString *prevRegionCode;
  NSString *clientDeploymentId;
  TRITrialFactorFields *factorFields;
  void *v19;
  TRITrialDownloadSettingsFields *downloadSettingsFields;
  void *v21;
  TRITrialCloudKitContainerOriginFields *containerOriginFields;
  void *v23;
  TRITrialAssetPurgeFields *assetPurgeFields;
  void *v25;
  TRITrialDownloadStatusFields *downloadStatusFields;
  void *v27;
  TRITrialOnDemandFactorFields *onDemandFactorFields;
  void *v29;
  NSString *prevCarrierCountryIsoCode;
  NSString *prevCarrierBundleIdentifier;
  void *v32;
  TRITrialMobileAssetOriginFields *mobileAssetOriginFields;
  void *v34;
  TRITrialBMLTFields *bmltFields;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientTeamId = self->_clientTeamId;
  if (clientTeamId)
    objc_msgSend(v3, "setObject:forKey:", clientTeamId, CFSTR("client_team_id"));
  clientProjectId = self->_clientProjectId;
  if (clientProjectId)
    objc_msgSend(v4, "setObject:forKey:", clientProjectId, CFSTR("client_project_id"));
  experimentFields = self->_experimentFields;
  if (experimentFields)
  {
    -[TRITrialExperimentFields dictionaryRepresentation](experimentFields, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("experiment_fields"));

  }
  rolloutFields = self->_rolloutFields;
  if (rolloutFields)
  {
    -[TRITrialRolloutFields dictionaryRepresentation](rolloutFields, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("rollout_fields"));

  }
  clientDeploymentEnv = self->_clientDeploymentEnv;
  if (clientDeploymentEnv)
    objc_msgSend(v4, "setObject:forKey:", clientDeploymentEnv, CFSTR("client_deployment_env"));
  trialdTaskName = self->_trialdTaskName;
  if (trialdTaskName)
    objc_msgSend(v4, "setObject:forKey:", trialdTaskName, CFSTR("triald_task_name"));
  prevOsBuild = self->_prevOsBuild;
  if (prevOsBuild)
    objc_msgSend(v4, "setObject:forKey:", prevOsBuild, CFSTR("prev_os_build"));
  prevBcp47DeviceLocale = self->_prevBcp47DeviceLocale;
  if (prevBcp47DeviceLocale)
    objc_msgSend(v4, "setObject:forKey:", prevBcp47DeviceLocale, CFSTR("prev_bcp47_device_locale"));
  prevLanguageCode = self->_prevLanguageCode;
  if (prevLanguageCode)
    objc_msgSend(v4, "setObject:forKey:", prevLanguageCode, CFSTR("prev_language_code"));
  prevRegionCode = self->_prevRegionCode;
  if (prevRegionCode)
    objc_msgSend(v4, "setObject:forKey:", prevRegionCode, CFSTR("prev_region_code"));
  clientDeploymentId = self->_clientDeploymentId;
  if (clientDeploymentId)
    objc_msgSend(v4, "setObject:forKey:", clientDeploymentId, CFSTR("client_deployment_id"));
  factorFields = self->_factorFields;
  if (factorFields)
  {
    -[TRITrialFactorFields dictionaryRepresentation](factorFields, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("factor_fields"));

  }
  downloadSettingsFields = self->_downloadSettingsFields;
  if (downloadSettingsFields)
  {
    -[TRITrialDownloadSettingsFields dictionaryRepresentation](downloadSettingsFields, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("download_settings_fields"));

  }
  containerOriginFields = self->_containerOriginFields;
  if (containerOriginFields)
  {
    -[TRITrialCloudKitContainerOriginFields dictionaryRepresentation](containerOriginFields, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("container_origin_fields"));

  }
  assetPurgeFields = self->_assetPurgeFields;
  if (assetPurgeFields)
  {
    -[TRITrialAssetPurgeFields dictionaryRepresentation](assetPurgeFields, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("asset_purge_fields"));

  }
  downloadStatusFields = self->_downloadStatusFields;
  if (downloadStatusFields)
  {
    -[TRITrialDownloadStatusFields dictionaryRepresentation](downloadStatusFields, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("download_status_fields"));

  }
  onDemandFactorFields = self->_onDemandFactorFields;
  if (onDemandFactorFields)
  {
    -[TRITrialOnDemandFactorFields dictionaryRepresentation](onDemandFactorFields, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("on_demand_factor_fields"));

  }
  prevCarrierCountryIsoCode = self->_prevCarrierCountryIsoCode;
  if (prevCarrierCountryIsoCode)
    objc_msgSend(v4, "setObject:forKey:", prevCarrierCountryIsoCode, CFSTR("prev_carrier_country_iso_code"));
  prevCarrierBundleIdentifier = self->_prevCarrierBundleIdentifier;
  if (prevCarrierBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", prevCarrierBundleIdentifier, CFSTR("prev_carrier_bundle_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prevExperimentOptOutStatus);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("prev_experiment_opt_out_status"));

  }
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  if (mobileAssetOriginFields)
  {
    -[TRITrialMobileAssetOriginFields dictionaryRepresentation](mobileAssetOriginFields, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("mobile_asset_origin_fields"));

  }
  bmltFields = self->_bmltFields;
  if (bmltFields)
  {
    -[TRITrialBMLTFields dictionaryRepresentation](bmltFields, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("bmlt_fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialSystemTelemetryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientTeamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientProjectId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_experimentFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rolloutFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_clientDeploymentEnv)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_trialdTaskName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prevOsBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prevBcp47DeviceLocale)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prevLanguageCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prevRegionCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientDeploymentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_factorFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_downloadSettingsFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_containerOriginFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_assetPurgeFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_downloadStatusFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_onDemandFactorFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_prevCarrierCountryIsoCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prevCarrierBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_mobileAssetOriginFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bmltFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientTeamId)
  {
    objc_msgSend(v4, "setClientTeamId:");
    v4 = v5;
  }
  if (self->_clientProjectId)
  {
    objc_msgSend(v5, "setClientProjectId:");
    v4 = v5;
  }
  if (self->_experimentFields)
  {
    objc_msgSend(v5, "setExperimentFields:");
    v4 = v5;
  }
  if (self->_rolloutFields)
  {
    objc_msgSend(v5, "setRolloutFields:");
    v4 = v5;
  }
  if (self->_clientDeploymentEnv)
  {
    objc_msgSend(v5, "setClientDeploymentEnv:");
    v4 = v5;
  }
  if (self->_trialdTaskName)
  {
    objc_msgSend(v5, "setTrialdTaskName:");
    v4 = v5;
  }
  if (self->_prevOsBuild)
  {
    objc_msgSend(v5, "setPrevOsBuild:");
    v4 = v5;
  }
  if (self->_prevBcp47DeviceLocale)
  {
    objc_msgSend(v5, "setPrevBcp47DeviceLocale:");
    v4 = v5;
  }
  if (self->_prevLanguageCode)
  {
    objc_msgSend(v5, "setPrevLanguageCode:");
    v4 = v5;
  }
  if (self->_prevRegionCode)
  {
    objc_msgSend(v5, "setPrevRegionCode:");
    v4 = v5;
  }
  if (self->_clientDeploymentId)
  {
    objc_msgSend(v5, "setClientDeploymentId:");
    v4 = v5;
  }
  if (self->_factorFields)
  {
    objc_msgSend(v5, "setFactorFields:");
    v4 = v5;
  }
  if (self->_downloadSettingsFields)
  {
    objc_msgSend(v5, "setDownloadSettingsFields:");
    v4 = v5;
  }
  if (self->_containerOriginFields)
  {
    objc_msgSend(v5, "setContainerOriginFields:");
    v4 = v5;
  }
  if (self->_assetPurgeFields)
  {
    objc_msgSend(v5, "setAssetPurgeFields:");
    v4 = v5;
  }
  if (self->_downloadStatusFields)
  {
    objc_msgSend(v5, "setDownloadStatusFields:");
    v4 = v5;
  }
  if (self->_onDemandFactorFields)
  {
    objc_msgSend(v5, "setOnDemandFactorFields:");
    v4 = v5;
  }
  if (self->_prevCarrierCountryIsoCode)
  {
    objc_msgSend(v5, "setPrevCarrierCountryIsoCode:");
    v4 = v5;
  }
  if (self->_prevCarrierBundleIdentifier)
  {
    objc_msgSend(v5, "setPrevCarrierBundleIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[176] = self->_prevExperimentOptOutStatus;
    v4[180] |= 1u;
  }
  if (self->_mobileAssetOriginFields)
  {
    objc_msgSend(v5, "setMobileAssetOriginFields:");
    v4 = v5;
  }
  if (self->_bmltFields)
  {
    objc_msgSend(v5, "setBmltFields:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientTeamId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_clientProjectId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[TRITrialExperimentFields copyWithZone:](self->_experimentFields, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[TRITrialRolloutFields copyWithZone:](self->_rolloutFields, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v12;

  v14 = -[NSString copyWithZone:](self->_clientDeploymentEnv, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_trialdTaskName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v16;

  v18 = -[NSString copyWithZone:](self->_prevOsBuild, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v18;

  v20 = -[NSString copyWithZone:](self->_prevBcp47DeviceLocale, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v20;

  v22 = -[NSString copyWithZone:](self->_prevLanguageCode, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v22;

  v24 = -[NSString copyWithZone:](self->_prevRegionCode, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v24;

  v26 = -[NSString copyWithZone:](self->_clientDeploymentId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v26;

  v28 = -[TRITrialFactorFields copyWithZone:](self->_factorFields, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v28;

  v30 = -[TRITrialDownloadSettingsFields copyWithZone:](self->_downloadSettingsFields, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v30;

  v32 = -[TRITrialCloudKitContainerOriginFields copyWithZone:](self->_containerOriginFields, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v32;

  v34 = -[TRITrialAssetPurgeFields copyWithZone:](self->_assetPurgeFields, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v34;

  v36 = -[TRITrialDownloadStatusFields copyWithZone:](self->_downloadStatusFields, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v36;

  v38 = -[TRITrialOnDemandFactorFields copyWithZone:](self->_onDemandFactorFields, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v38;

  v40 = -[NSString copyWithZone:](self->_prevCarrierCountryIsoCode, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v40;

  v42 = -[NSString copyWithZone:](self->_prevCarrierBundleIdentifier, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v42;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 176) = self->_prevExperimentOptOutStatus;
    *(_BYTE *)(v5 + 180) |= 1u;
  }
  v44 = -[TRITrialMobileAssetOriginFields copyWithZone:](self->_mobileAssetOriginFields, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v44;

  v46 = -[TRITrialBMLTFields copyWithZone:](self->_bmltFields, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v46;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientTeamId;
  NSString *clientProjectId;
  TRITrialExperimentFields *experimentFields;
  TRITrialRolloutFields *rolloutFields;
  NSString *clientDeploymentEnv;
  NSString *trialdTaskName;
  NSString *prevOsBuild;
  NSString *prevBcp47DeviceLocale;
  NSString *prevLanguageCode;
  NSString *prevRegionCode;
  NSString *clientDeploymentId;
  TRITrialFactorFields *factorFields;
  TRITrialDownloadSettingsFields *downloadSettingsFields;
  TRITrialCloudKitContainerOriginFields *containerOriginFields;
  TRITrialAssetPurgeFields *assetPurgeFields;
  TRITrialDownloadStatusFields *downloadStatusFields;
  TRITrialOnDemandFactorFields *onDemandFactorFields;
  NSString *prevCarrierCountryIsoCode;
  NSString *prevCarrierBundleIdentifier;
  TRITrialMobileAssetOriginFields *mobileAssetOriginFields;
  TRITrialBMLTFields *bmltFields;
  char v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  clientTeamId = self->_clientTeamId;
  if ((unint64_t)clientTeamId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientTeamId, "isEqual:"))
      goto LABEL_52;
  }
  clientProjectId = self->_clientProjectId;
  if ((unint64_t)clientProjectId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientProjectId, "isEqual:"))
      goto LABEL_52;
  }
  experimentFields = self->_experimentFields;
  if ((unint64_t)experimentFields | *((_QWORD *)v4 + 10))
  {
    if (!-[TRITrialExperimentFields isEqual:](experimentFields, "isEqual:"))
      goto LABEL_52;
  }
  rolloutFields = self->_rolloutFields;
  if ((unint64_t)rolloutFields | *((_QWORD *)v4 + 20))
  {
    if (!-[TRITrialRolloutFields isEqual:](rolloutFields, "isEqual:"))
      goto LABEL_52;
  }
  clientDeploymentEnv = self->_clientDeploymentEnv;
  if ((unint64_t)clientDeploymentEnv | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientDeploymentEnv, "isEqual:"))
      goto LABEL_52;
  }
  trialdTaskName = self->_trialdTaskName;
  if ((unint64_t)trialdTaskName | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](trialdTaskName, "isEqual:"))
      goto LABEL_52;
  }
  prevOsBuild = self->_prevOsBuild;
  if ((unint64_t)prevOsBuild | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](prevOsBuild, "isEqual:"))
      goto LABEL_52;
  }
  prevBcp47DeviceLocale = self->_prevBcp47DeviceLocale;
  if ((unint64_t)prevBcp47DeviceLocale | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](prevBcp47DeviceLocale, "isEqual:"))
      goto LABEL_52;
  }
  prevLanguageCode = self->_prevLanguageCode;
  if ((unint64_t)prevLanguageCode | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](prevLanguageCode, "isEqual:"))
      goto LABEL_52;
  }
  prevRegionCode = self->_prevRegionCode;
  if ((unint64_t)prevRegionCode | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](prevRegionCode, "isEqual:"))
      goto LABEL_52;
  }
  clientDeploymentId = self->_clientDeploymentId;
  if ((unint64_t)clientDeploymentId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientDeploymentId, "isEqual:"))
      goto LABEL_52;
  }
  factorFields = self->_factorFields;
  if ((unint64_t)factorFields | *((_QWORD *)v4 + 11))
  {
    if (!-[TRITrialFactorFields isEqual:](factorFields, "isEqual:"))
      goto LABEL_52;
  }
  downloadSettingsFields = self->_downloadSettingsFields;
  if ((unint64_t)downloadSettingsFields | *((_QWORD *)v4 + 8))
  {
    if (!-[TRITrialDownloadSettingsFields isEqual:](downloadSettingsFields, "isEqual:"))
      goto LABEL_52;
  }
  containerOriginFields = self->_containerOriginFields;
  if ((unint64_t)containerOriginFields | *((_QWORD *)v4 + 7))
  {
    if (!-[TRITrialCloudKitContainerOriginFields isEqual:](containerOriginFields, "isEqual:"))
      goto LABEL_52;
  }
  assetPurgeFields = self->_assetPurgeFields;
  if ((unint64_t)assetPurgeFields | *((_QWORD *)v4 + 1))
  {
    if (!-[TRITrialAssetPurgeFields isEqual:](assetPurgeFields, "isEqual:"))
      goto LABEL_52;
  }
  downloadStatusFields = self->_downloadStatusFields;
  if ((unint64_t)downloadStatusFields | *((_QWORD *)v4 + 9))
  {
    if (!-[TRITrialDownloadStatusFields isEqual:](downloadStatusFields, "isEqual:"))
      goto LABEL_52;
  }
  onDemandFactorFields = self->_onDemandFactorFields;
  if ((unint64_t)onDemandFactorFields | *((_QWORD *)v4 + 13))
  {
    if (!-[TRITrialOnDemandFactorFields isEqual:](onDemandFactorFields, "isEqual:"))
      goto LABEL_52;
  }
  prevCarrierCountryIsoCode = self->_prevCarrierCountryIsoCode;
  if ((unint64_t)prevCarrierCountryIsoCode | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](prevCarrierCountryIsoCode, "isEqual:"))
      goto LABEL_52;
  }
  prevCarrierBundleIdentifier = self->_prevCarrierBundleIdentifier;
  if ((unint64_t)prevCarrierBundleIdentifier | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](prevCarrierBundleIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 180) & 1) != 0)
    {
      if (self->_prevExperimentOptOutStatus)
      {
        if (!*((_BYTE *)v4 + 176))
          goto LABEL_52;
        goto LABEL_48;
      }
      if (!*((_BYTE *)v4 + 176))
        goto LABEL_48;
    }
LABEL_52:
    v26 = 0;
    goto LABEL_53;
  }
  if ((*((_BYTE *)v4 + 180) & 1) != 0)
    goto LABEL_52;
LABEL_48:
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  if ((unint64_t)mobileAssetOriginFields | *((_QWORD *)v4 + 12)
    && !-[TRITrialMobileAssetOriginFields isEqual:](mobileAssetOriginFields, "isEqual:"))
  {
    goto LABEL_52;
  }
  bmltFields = self->_bmltFields;
  if ((unint64_t)bmltFields | *((_QWORD *)v4 + 2))
    v26 = -[TRITrialBMLTFields isEqual:](bmltFields, "isEqual:");
  else
    v26 = 1;
LABEL_53:

  return v26;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  unint64_t v15;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  unint64_t v22;
  unint64_t v23;
  NSUInteger v24;
  NSUInteger v25;

  v25 = -[NSString hash](self->_clientTeamId, "hash");
  v24 = -[NSString hash](self->_clientProjectId, "hash");
  v23 = -[TRITrialExperimentFields hash](self->_experimentFields, "hash");
  v22 = -[TRITrialRolloutFields hash](self->_rolloutFields, "hash");
  v21 = -[NSString hash](self->_clientDeploymentEnv, "hash");
  v20 = -[NSString hash](self->_trialdTaskName, "hash");
  v19 = -[NSString hash](self->_prevOsBuild, "hash");
  v18 = -[NSString hash](self->_prevBcp47DeviceLocale, "hash");
  v17 = -[NSString hash](self->_prevLanguageCode, "hash");
  v3 = -[NSString hash](self->_prevRegionCode, "hash");
  v4 = -[NSString hash](self->_clientDeploymentId, "hash");
  v5 = -[TRITrialFactorFields hash](self->_factorFields, "hash");
  v6 = -[TRITrialDownloadSettingsFields hash](self->_downloadSettingsFields, "hash");
  v7 = -[TRITrialCloudKitContainerOriginFields hash](self->_containerOriginFields, "hash");
  v8 = -[TRITrialAssetPurgeFields hash](self->_assetPurgeFields, "hash");
  v9 = -[TRITrialDownloadStatusFields hash](self->_downloadStatusFields, "hash");
  v10 = -[TRITrialOnDemandFactorFields hash](self->_onDemandFactorFields, "hash");
  v11 = -[NSString hash](self->_prevCarrierCountryIsoCode, "hash");
  v12 = -[NSString hash](self->_prevCarrierBundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_prevExperimentOptOutStatus;
  else
    v13 = 0;
  v14 = v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v15 = v10 ^ v11 ^ v12 ^ v13 ^ -[TRITrialMobileAssetOriginFields hash](self->_mobileAssetOriginFields, "hash");
  return v14 ^ v15 ^ -[TRITrialBMLTFields hash](self->_bmltFields, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  TRITrialExperimentFields *experimentFields;
  uint64_t v6;
  TRITrialRolloutFields *rolloutFields;
  uint64_t v8;
  TRITrialFactorFields *factorFields;
  uint64_t v10;
  TRITrialDownloadSettingsFields *downloadSettingsFields;
  uint64_t v12;
  TRITrialCloudKitContainerOriginFields *containerOriginFields;
  uint64_t v14;
  TRITrialAssetPurgeFields *assetPurgeFields;
  uint64_t v16;
  TRITrialDownloadStatusFields *downloadStatusFields;
  uint64_t v18;
  TRITrialOnDemandFactorFields *onDemandFactorFields;
  uint64_t v20;
  TRITrialMobileAssetOriginFields *mobileAssetOriginFields;
  uint64_t v22;
  TRITrialBMLTFields *bmltFields;
  uint64_t v24;
  BOOL *v25;

  v4 = (BOOL *)a3;
  v25 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[TRITrialSystemTelemetry setClientTeamId:](self, "setClientTeamId:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[TRITrialSystemTelemetry setClientProjectId:](self, "setClientProjectId:");
    v4 = v25;
  }
  experimentFields = self->_experimentFields;
  v6 = *((_QWORD *)v4 + 10);
  if (experimentFields)
  {
    if (!v6)
      goto LABEL_11;
    -[TRITrialExperimentFields mergeFrom:](experimentFields, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[TRITrialSystemTelemetry setExperimentFields:](self, "setExperimentFields:");
  }
  v4 = v25;
LABEL_11:
  rolloutFields = self->_rolloutFields;
  v8 = *((_QWORD *)v4 + 20);
  if (rolloutFields)
  {
    if (!v8)
      goto LABEL_17;
    -[TRITrialRolloutFields mergeFrom:](rolloutFields, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[TRITrialSystemTelemetry setRolloutFields:](self, "setRolloutFields:");
  }
  v4 = v25;
LABEL_17:
  if (*((_QWORD *)v4 + 3))
  {
    -[TRITrialSystemTelemetry setClientDeploymentEnv:](self, "setClientDeploymentEnv:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[TRITrialSystemTelemetry setTrialdTaskName:](self, "setTrialdTaskName:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[TRITrialSystemTelemetry setPrevOsBuild:](self, "setPrevOsBuild:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[TRITrialSystemTelemetry setPrevBcp47DeviceLocale:](self, "setPrevBcp47DeviceLocale:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[TRITrialSystemTelemetry setPrevLanguageCode:](self, "setPrevLanguageCode:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[TRITrialSystemTelemetry setPrevRegionCode:](self, "setPrevRegionCode:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[TRITrialSystemTelemetry setClientDeploymentId:](self, "setClientDeploymentId:");
    v4 = v25;
  }
  factorFields = self->_factorFields;
  v10 = *((_QWORD *)v4 + 11);
  if (factorFields)
  {
    if (!v10)
      goto LABEL_37;
    -[TRITrialFactorFields mergeFrom:](factorFields, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_37;
    -[TRITrialSystemTelemetry setFactorFields:](self, "setFactorFields:");
  }
  v4 = v25;
LABEL_37:
  downloadSettingsFields = self->_downloadSettingsFields;
  v12 = *((_QWORD *)v4 + 8);
  if (downloadSettingsFields)
  {
    if (!v12)
      goto LABEL_43;
    -[TRITrialDownloadSettingsFields mergeFrom:](downloadSettingsFields, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_43;
    -[TRITrialSystemTelemetry setDownloadSettingsFields:](self, "setDownloadSettingsFields:");
  }
  v4 = v25;
LABEL_43:
  containerOriginFields = self->_containerOriginFields;
  v14 = *((_QWORD *)v4 + 7);
  if (containerOriginFields)
  {
    if (!v14)
      goto LABEL_49;
    -[TRITrialCloudKitContainerOriginFields mergeFrom:](containerOriginFields, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_49;
    -[TRITrialSystemTelemetry setContainerOriginFields:](self, "setContainerOriginFields:");
  }
  v4 = v25;
LABEL_49:
  assetPurgeFields = self->_assetPurgeFields;
  v16 = *((_QWORD *)v4 + 1);
  if (assetPurgeFields)
  {
    if (!v16)
      goto LABEL_55;
    -[TRITrialAssetPurgeFields mergeFrom:](assetPurgeFields, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_55;
    -[TRITrialSystemTelemetry setAssetPurgeFields:](self, "setAssetPurgeFields:");
  }
  v4 = v25;
LABEL_55:
  downloadStatusFields = self->_downloadStatusFields;
  v18 = *((_QWORD *)v4 + 9);
  if (downloadStatusFields)
  {
    if (!v18)
      goto LABEL_61;
    -[TRITrialDownloadStatusFields mergeFrom:](downloadStatusFields, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_61;
    -[TRITrialSystemTelemetry setDownloadStatusFields:](self, "setDownloadStatusFields:");
  }
  v4 = v25;
LABEL_61:
  onDemandFactorFields = self->_onDemandFactorFields;
  v20 = *((_QWORD *)v4 + 13);
  if (onDemandFactorFields)
  {
    if (!v20)
      goto LABEL_67;
    -[TRITrialOnDemandFactorFields mergeFrom:](onDemandFactorFields, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_67;
    -[TRITrialSystemTelemetry setOnDemandFactorFields:](self, "setOnDemandFactorFields:");
  }
  v4 = v25;
LABEL_67:
  if (*((_QWORD *)v4 + 16))
  {
    -[TRITrialSystemTelemetry setPrevCarrierCountryIsoCode:](self, "setPrevCarrierCountryIsoCode:");
    v4 = v25;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[TRITrialSystemTelemetry setPrevCarrierBundleIdentifier:](self, "setPrevCarrierBundleIdentifier:");
    v4 = v25;
  }
  if (v4[180])
  {
    self->_prevExperimentOptOutStatus = v4[176];
    *(_BYTE *)&self->_has |= 1u;
  }
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  v22 = *((_QWORD *)v4 + 12);
  if (mobileAssetOriginFields)
  {
    if (!v22)
      goto LABEL_79;
    -[TRITrialMobileAssetOriginFields mergeFrom:](mobileAssetOriginFields, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_79;
    -[TRITrialSystemTelemetry setMobileAssetOriginFields:](self, "setMobileAssetOriginFields:");
  }
  v4 = v25;
LABEL_79:
  bmltFields = self->_bmltFields;
  v24 = *((_QWORD *)v4 + 2);
  if (bmltFields)
  {
    if (v24)
    {
      -[TRITrialBMLTFields mergeFrom:](bmltFields, "mergeFrom:");
LABEL_84:
      v4 = v25;
    }
  }
  else if (v24)
  {
    -[TRITrialSystemTelemetry setBmltFields:](self, "setBmltFields:");
    goto LABEL_84;
  }

}

- (NSString)clientTeamId
{
  return self->_clientTeamId;
}

- (void)setClientTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_clientTeamId, a3);
}

- (NSString)clientProjectId
{
  return self->_clientProjectId;
}

- (void)setClientProjectId:(id)a3
{
  objc_storeStrong((id *)&self->_clientProjectId, a3);
}

- (TRITrialExperimentFields)experimentFields
{
  return self->_experimentFields;
}

- (void)setExperimentFields:(id)a3
{
  objc_storeStrong((id *)&self->_experimentFields, a3);
}

- (TRITrialRolloutFields)rolloutFields
{
  return self->_rolloutFields;
}

- (void)setRolloutFields:(id)a3
{
  objc_storeStrong((id *)&self->_rolloutFields, a3);
}

- (NSString)clientDeploymentEnv
{
  return self->_clientDeploymentEnv;
}

- (void)setClientDeploymentEnv:(id)a3
{
  objc_storeStrong((id *)&self->_clientDeploymentEnv, a3);
}

- (NSString)trialdTaskName
{
  return self->_trialdTaskName;
}

- (void)setTrialdTaskName:(id)a3
{
  objc_storeStrong((id *)&self->_trialdTaskName, a3);
}

- (NSString)prevOsBuild
{
  return self->_prevOsBuild;
}

- (void)setPrevOsBuild:(id)a3
{
  objc_storeStrong((id *)&self->_prevOsBuild, a3);
}

- (NSString)prevBcp47DeviceLocale
{
  return self->_prevBcp47DeviceLocale;
}

- (void)setPrevBcp47DeviceLocale:(id)a3
{
  objc_storeStrong((id *)&self->_prevBcp47DeviceLocale, a3);
}

- (NSString)prevLanguageCode
{
  return self->_prevLanguageCode;
}

- (void)setPrevLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_prevLanguageCode, a3);
}

- (NSString)prevRegionCode
{
  return self->_prevRegionCode;
}

- (void)setPrevRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_prevRegionCode, a3);
}

- (NSString)clientDeploymentId
{
  return self->_clientDeploymentId;
}

- (void)setClientDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_clientDeploymentId, a3);
}

- (TRITrialFactorFields)factorFields
{
  return self->_factorFields;
}

- (void)setFactorFields:(id)a3
{
  objc_storeStrong((id *)&self->_factorFields, a3);
}

- (TRITrialDownloadSettingsFields)downloadSettingsFields
{
  return self->_downloadSettingsFields;
}

- (void)setDownloadSettingsFields:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSettingsFields, a3);
}

- (TRITrialCloudKitContainerOriginFields)containerOriginFields
{
  return self->_containerOriginFields;
}

- (void)setContainerOriginFields:(id)a3
{
  objc_storeStrong((id *)&self->_containerOriginFields, a3);
}

- (TRITrialAssetPurgeFields)assetPurgeFields
{
  return self->_assetPurgeFields;
}

- (void)setAssetPurgeFields:(id)a3
{
  objc_storeStrong((id *)&self->_assetPurgeFields, a3);
}

- (TRITrialDownloadStatusFields)downloadStatusFields
{
  return self->_downloadStatusFields;
}

- (void)setDownloadStatusFields:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStatusFields, a3);
}

- (TRITrialOnDemandFactorFields)onDemandFactorFields
{
  return self->_onDemandFactorFields;
}

- (void)setOnDemandFactorFields:(id)a3
{
  objc_storeStrong((id *)&self->_onDemandFactorFields, a3);
}

- (NSString)prevCarrierCountryIsoCode
{
  return self->_prevCarrierCountryIsoCode;
}

- (void)setPrevCarrierCountryIsoCode:(id)a3
{
  objc_storeStrong((id *)&self->_prevCarrierCountryIsoCode, a3);
}

- (NSString)prevCarrierBundleIdentifier
{
  return self->_prevCarrierBundleIdentifier;
}

- (void)setPrevCarrierBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_prevCarrierBundleIdentifier, a3);
}

- (BOOL)prevExperimentOptOutStatus
{
  return self->_prevExperimentOptOutStatus;
}

- (TRITrialMobileAssetOriginFields)mobileAssetOriginFields
{
  return self->_mobileAssetOriginFields;
}

- (void)setMobileAssetOriginFields:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetOriginFields, a3);
}

- (TRITrialBMLTFields)bmltFields
{
  return self->_bmltFields;
}

- (void)setBmltFields:(id)a3
{
  objc_storeStrong((id *)&self->_bmltFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialdTaskName, 0);
  objc_storeStrong((id *)&self->_rolloutFields, 0);
  objc_storeStrong((id *)&self->_prevRegionCode, 0);
  objc_storeStrong((id *)&self->_prevOsBuild, 0);
  objc_storeStrong((id *)&self->_prevLanguageCode, 0);
  objc_storeStrong((id *)&self->_prevCarrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_prevCarrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_prevBcp47DeviceLocale, 0);
  objc_storeStrong((id *)&self->_onDemandFactorFields, 0);
  objc_storeStrong((id *)&self->_mobileAssetOriginFields, 0);
  objc_storeStrong((id *)&self->_factorFields, 0);
  objc_storeStrong((id *)&self->_experimentFields, 0);
  objc_storeStrong((id *)&self->_downloadStatusFields, 0);
  objc_storeStrong((id *)&self->_downloadSettingsFields, 0);
  objc_storeStrong((id *)&self->_containerOriginFields, 0);
  objc_storeStrong((id *)&self->_clientTeamId, 0);
  objc_storeStrong((id *)&self->_clientProjectId, 0);
  objc_storeStrong((id *)&self->_clientDeploymentId, 0);
  objc_storeStrong((id *)&self->_clientDeploymentEnv, 0);
  objc_storeStrong((id *)&self->_bmltFields, 0);
  objc_storeStrong((id *)&self->_assetPurgeFields, 0);
}

- (id)ensureExperimentFields
{
  void *v3;

  -[TRITrialSystemTelemetry experimentFields](self, "experimentFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setExperimentFields:](self, "setExperimentFields:", v3);
  }
  return v3;
}

- (id)ensureRolloutFields
{
  void *v3;

  -[TRITrialSystemTelemetry rolloutFields](self, "rolloutFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setRolloutFields:](self, "setRolloutFields:", v3);
  }
  return v3;
}

- (id)ensureBMLTFields
{
  void *v3;

  -[TRITrialSystemTelemetry bmltFields](self, "bmltFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setBmltFields:](self, "setBmltFields:", v3);
  }
  return v3;
}

- (id)ensureFactorFields
{
  void *v3;

  -[TRITrialSystemTelemetry factorFields](self, "factorFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setFactorFields:](self, "setFactorFields:", v3);
  }
  return v3;
}

- (id)ensureOnDemandFactorFields
{
  void *v3;

  -[TRITrialSystemTelemetry onDemandFactorFields](self, "onDemandFactorFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setOnDemandFactorFields:](self, "setOnDemandFactorFields:", v3);
  }
  return v3;
}

- (id)ensureAssetPurgeFields
{
  void *v3;

  -[TRITrialSystemTelemetry assetPurgeFields](self, "assetPurgeFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setAssetPurgeFields:](self, "setAssetPurgeFields:", v3);
  }
  return v3;
}

- (id)ensureMobileAssetOriginFields
{
  void *v3;

  -[TRITrialSystemTelemetry mobileAssetOriginFields](self, "mobileAssetOriginFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[TRITrialSystemTelemetry setMobileAssetOriginFields:](self, "setMobileAssetOriginFields:", v3);
  }
  return v3;
}

- (void)setFieldsForDownloadOptions:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  -[TRITrialSystemTelemetry downloadSettingsFields](self, "downloadSettingsFields");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (id)objc_opt_new();
    -[TRITrialSystemTelemetry setDownloadSettingsFields:](self, "setDownloadSettingsFields:");
  }
  objc_msgSend(v6, "setAllowAnyNetworking:", objc_msgSend(v4, "allowsCellularAccess"));
  v5 = objc_msgSend(v4, "discretionaryBehavior");

  if (v5 <= 2)
    objc_msgSend(v6, "setDiscretionaryBehavior:", dword_1921A450C[v5]);

}

- (void)setFieldsForRolloutDeployment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialSystemTelemetry setClientDeploymentId:](self, "setClientDeploymentId:", v7);

  -[TRITrialSystemTelemetry ensureRolloutFields](self, "ensureRolloutFields");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rolloutId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setClientRolloutId:", v8);
}

@end
