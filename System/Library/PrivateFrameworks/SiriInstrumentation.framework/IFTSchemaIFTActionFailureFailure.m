@implementation IFTSchemaIFTActionFailureFailure

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPreflightCheckFailure:(BOOL)a3
{
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 1;
  self->_preflightCheckFailure = a3;
}

- (BOOL)preflightCheckFailure
{
  return self->_whichOneof_Actionfailurefailure == 1 && self->_preflightCheckFailure;
}

- (void)deletePreflightCheckFailure
{
  if (self->_whichOneof_Actionfailurefailure == 1)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_preflightCheckFailure = 0;
  }
}

- (void)setPreciseLocationDisabled:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 2;
  self->_preciseLocationDisabled = a3;
}

- (BOOL)preciseLocationDisabled
{
  return self->_whichOneof_Actionfailurefailure == 2 && self->_preciseLocationDisabled;
}

- (void)deletePreciseLocationDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 2)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_preciseLocationDisabled = 0;
  }
}

- (void)setLocationDisabled:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 3;
  self->_locationDisabled = a3;
}

- (BOOL)locationDisabled
{
  return self->_whichOneof_Actionfailurefailure == 3 && self->_locationDisabled;
}

- (void)deleteLocationDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 3)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_locationDisabled = 0;
  }
}

- (void)setWifiDisabled:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 4;
  self->_wifiDisabled = a3;
}

- (BOOL)wifiDisabled
{
  return self->_whichOneof_Actionfailurefailure == 4 && self->_wifiDisabled;
}

- (void)deleteWifiDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 4)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_wifiDisabled = 0;
  }
}

- (void)setBluetoothDisabled:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 5;
  self->_bluetoothDisabled = a3;
}

- (BOOL)bluetoothDisabled
{
  return self->_whichOneof_Actionfailurefailure == 5 && self->_bluetoothDisabled;
}

- (void)deleteBluetoothDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 5)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_bluetoothDisabled = 0;
  }
}

- (void)setNetworkFailure:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 6;
  self->_networkFailure = a3;
}

- (BOOL)networkFailure
{
  return self->_whichOneof_Actionfailurefailure == 6 && self->_networkFailure;
}

- (void)deleteNetworkFailure
{
  if (self->_whichOneof_Actionfailurefailure == 6)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_networkFailure = 0;
  }
}

- (void)setPartialFailure:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 7;
  self->_partialFailure = a3;
}

- (BOOL)partialFailure
{
  return self->_whichOneof_Actionfailurefailure == 7 && self->_partialFailure;
}

- (void)deletePartialFailure
{
  if (self->_whichOneof_Actionfailurefailure == 7)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_partialFailure = 0;
  }
}

- (void)setUnsupportedOnDevice:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 8;
  self->_unsupportedOnDevice = a3;
}

- (BOOL)unsupportedOnDevice
{
  return self->_whichOneof_Actionfailurefailure == 8 && self->_unsupportedOnDevice;
}

- (void)deleteUnsupportedOnDevice
{
  if (self->_whichOneof_Actionfailurefailure == 8)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_unsupportedOnDevice = 0;
  }
}

- (void)setFeatureCurrentlyRestricted:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 9;
  self->_featureCurrentlyRestricted = a3;
}

- (BOOL)featureCurrentlyRestricted
{
  return self->_whichOneof_Actionfailurefailure == 9 && self->_featureCurrentlyRestricted;
}

- (void)deleteFeatureCurrentlyRestricted
{
  if (self->_whichOneof_Actionfailurefailure == 9)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_featureCurrentlyRestricted = 0;
  }
}

- (void)setEntityNotFound:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 10;
  self->_entityNotFound = a3;
}

- (BOOL)entityNotFound
{
  return self->_whichOneof_Actionfailurefailure == 10 && self->_entityNotFound;
}

- (void)deleteEntityNotFound
{
  if (self->_whichOneof_Actionfailurefailure == 10)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_entityNotFound = 0;
  }
}

- (void)setActionNotAllowed:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 11;
  self->_actionNotAllowed = a3;
}

- (BOOL)actionNotAllowed
{
  return self->_whichOneof_Actionfailurefailure == 11 && self->_actionNotAllowed;
}

- (void)deleteActionNotAllowed
{
  if (self->_whichOneof_Actionfailurefailure == 11)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_actionNotAllowed = 0;
  }
}

- (void)setUnableToUndo:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 12;
  self->_unableToUndo = a3;
}

- (BOOL)unableToUndo
{
  return self->_whichOneof_Actionfailurefailure == 12 && self->_unableToUndo;
}

- (void)deleteUnableToUndo
{
  if (self->_whichOneof_Actionfailurefailure == 12)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_unableToUndo = 0;
  }
}

- (void)setActionCanceled:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 13;
  self->_actionCanceled = a3;
}

- (BOOL)actionCanceled
{
  return self->_whichOneof_Actionfailurefailure == 13 && self->_actionCanceled;
}

- (void)deleteActionCanceled
{
  if (self->_whichOneof_Actionfailurefailure == 13)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_actionCanceled = 0;
  }
}

- (void)setValueDisambiguationRejected:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_noMatchingTool = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 14;
  self->_valueDisambiguationRejected = a3;
}

- (BOOL)valueDisambiguationRejected
{
  return self->_whichOneof_Actionfailurefailure == 14 && self->_valueDisambiguationRejected;
}

- (void)deleteValueDisambiguationRejected
{
  if (self->_whichOneof_Actionfailurefailure == 14)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_valueDisambiguationRejected = 0;
  }
}

- (void)setNoMatchingTool:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_developerDefinedError = 0;
  self->_whichOneof_Actionfailurefailure = 15;
  self->_noMatchingTool = a3;
}

- (BOOL)noMatchingTool
{
  return self->_whichOneof_Actionfailurefailure == 15 && self->_noMatchingTool;
}

- (void)deleteNoMatchingTool
{
  if (self->_whichOneof_Actionfailurefailure == 15)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_noMatchingTool = 0;
  }
}

- (void)setDeveloperDefinedError:(BOOL)a3
{
  self->_preflightCheckFailure = 0;
  self->_preciseLocationDisabled = 0;
  self->_locationDisabled = 0;
  self->_wifiDisabled = 0;
  self->_bluetoothDisabled = 0;
  self->_networkFailure = 0;
  self->_partialFailure = 0;
  self->_unsupportedOnDevice = 0;
  self->_featureCurrentlyRestricted = 0;
  self->_entityNotFound = 0;
  self->_actionNotAllowed = 0;
  self->_unableToUndo = 0;
  self->_actionCanceled = 0;
  self->_valueDisambiguationRejected = 0;
  self->_noMatchingTool = 0;
  self->_whichOneof_Actionfailurefailure = 16;
  self->_developerDefinedError = a3;
}

- (BOOL)developerDefinedError
{
  return self->_whichOneof_Actionfailurefailure == 16 && self->_developerDefinedError;
}

- (void)deleteDeveloperDefinedError
{
  if (self->_whichOneof_Actionfailurefailure == 16)
  {
    self->_whichOneof_Actionfailurefailure = 0;
    self->_developerDefinedError = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionFailureFailureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichOneof_Actionfailurefailure;
  id v5;

  v5 = a3;
  whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  if (whichOneof_Actionfailurefailure == 1)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 2)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 3)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 4)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 5)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 6)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 7)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 8)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 9)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 10)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 11)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 12)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 13)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 14)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 15)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 16)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Actionfailurefailure;
  int preflightCheckFailure;
  int preciseLocationDisabled;
  int locationDisabled;
  int wifiDisabled;
  int bluetoothDisabled;
  int networkFailure;
  int partialFailure;
  int unsupportedOnDevice;
  int featureCurrentlyRestricted;
  int entityNotFound;
  int actionNotAllowed;
  int unableToUndo;
  int actionCanceled;
  int valueDisambiguationRejected;
  int noMatchingTool;
  int developerDefinedError;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  if (whichOneof_Actionfailurefailure != objc_msgSend(v4, "whichOneof_Actionfailurefailure"))
    goto LABEL_19;
  preflightCheckFailure = self->_preflightCheckFailure;
  if (preflightCheckFailure != objc_msgSend(v4, "preflightCheckFailure"))
    goto LABEL_19;
  preciseLocationDisabled = self->_preciseLocationDisabled;
  if (preciseLocationDisabled != objc_msgSend(v4, "preciseLocationDisabled"))
    goto LABEL_19;
  locationDisabled = self->_locationDisabled;
  if (locationDisabled != objc_msgSend(v4, "locationDisabled"))
    goto LABEL_19;
  wifiDisabled = self->_wifiDisabled;
  if (wifiDisabled != objc_msgSend(v4, "wifiDisabled"))
    goto LABEL_19;
  bluetoothDisabled = self->_bluetoothDisabled;
  if (bluetoothDisabled != objc_msgSend(v4, "bluetoothDisabled"))
    goto LABEL_19;
  networkFailure = self->_networkFailure;
  if (networkFailure != objc_msgSend(v4, "networkFailure"))
    goto LABEL_19;
  partialFailure = self->_partialFailure;
  if (partialFailure != objc_msgSend(v4, "partialFailure"))
    goto LABEL_19;
  unsupportedOnDevice = self->_unsupportedOnDevice;
  if (unsupportedOnDevice != objc_msgSend(v4, "unsupportedOnDevice"))
    goto LABEL_19;
  featureCurrentlyRestricted = self->_featureCurrentlyRestricted;
  if (featureCurrentlyRestricted == objc_msgSend(v4, "featureCurrentlyRestricted")
    && (entityNotFound = self->_entityNotFound, entityNotFound == objc_msgSend(v4, "entityNotFound"))
    && (actionNotAllowed = self->_actionNotAllowed,
        actionNotAllowed == objc_msgSend(v4, "actionNotAllowed"))
    && (unableToUndo = self->_unableToUndo, unableToUndo == objc_msgSend(v4, "unableToUndo"))
    && (actionCanceled = self->_actionCanceled, actionCanceled == objc_msgSend(v4, "actionCanceled"))
    && (valueDisambiguationRejected = self->_valueDisambiguationRejected,
        valueDisambiguationRejected == objc_msgSend(v4, "valueDisambiguationRejected"))
    && (noMatchingTool = self->_noMatchingTool, noMatchingTool == objc_msgSend(v4, "noMatchingTool")))
  {
    developerDefinedError = self->_developerDefinedError;
    v22 = developerDefinedError == objc_msgSend(v4, "developerDefinedError");
  }
  else
  {
LABEL_19:
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_whichOneof_Actionfailurefailure - 1;
  if (v2 > 0xF)
    return 0;
  else
    return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E563DB00[v2]);
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Actionfailurefailure;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  if (whichOneof_Actionfailurefailure == 13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure actionCanceled](self, "actionCanceled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCanceled"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure actionNotAllowed](self, "actionNotAllowed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionNotAllowed"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure bluetoothDisabled](self, "bluetoothDisabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bluetoothDisabled"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure developerDefinedError](self, "developerDefinedError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("developerDefinedError"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure entityNotFound](self, "entityNotFound"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityNotFound"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure featureCurrentlyRestricted](self, "featureCurrentlyRestricted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("featureCurrentlyRestricted"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure locationDisabled](self, "locationDisabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("locationDisabled"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure networkFailure](self, "networkFailure"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("networkFailure"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure noMatchingTool](self, "noMatchingTool"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("noMatchingTool"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure partialFailure](self, "partialFailure"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("partialFailure"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure preciseLocationDisabled](self, "preciseLocationDisabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("preciseLocationDisabled"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure preflightCheckFailure](self, "preflightCheckFailure"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("preflightCheckFailure"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure unableToUndo](self, "unableToUndo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("unableToUndo"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure unsupportedOnDevice](self, "unsupportedOnDevice"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("unsupportedOnDevice"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure valueDisambiguationRejected](self, "valueDisambiguationRejected"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("valueDisambiguationRejected"));

    whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionFailureFailure wifiDisabled](self, "wifiDisabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("wifiDisabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTActionFailureFailure dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (IFTSchemaIFTActionFailureFailure)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTActionFailureFailure *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[IFTSchemaIFTActionFailureFailure initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTActionFailureFailure)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTActionFailureFailure *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  IFTSchemaIFTActionFailureFailure *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)IFTSchemaIFTActionFailureFailure;
  v5 = -[IFTSchemaIFTActionFailureFailure init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preflightCheckFailure"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setPreflightCheckFailure:](v5, "setPreflightCheckFailure:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preciseLocationDisabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setPreciseLocationDisabled:](v5, "setPreciseLocationDisabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationDisabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setLocationDisabled:](v5, "setLocationDisabled:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifiDisabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setWifiDisabled:](v5, "setWifiDisabled:", objc_msgSend(v9, "BOOLValue"));
    v32 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bluetoothDisabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setBluetoothDisabled:](v5, "setBluetoothDisabled:", objc_msgSend(v10, "BOOLValue"));
    v11 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkFailure"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setNetworkFailure:](v5, "setNetworkFailure:", objc_msgSend(v12, "BOOLValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("partialFailure"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setPartialFailure:](v5, "setPartialFailure:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unsupportedOnDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setUnsupportedOnDevice:](v5, "setUnsupportedOnDevice:", objc_msgSend(v15, "BOOLValue"));
    v34 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureCurrentlyRestricted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setFeatureCurrentlyRestricted:](v5, "setFeatureCurrentlyRestricted:", objc_msgSend(v16, "BOOLValue"));
    v33 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityNotFound"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setEntityNotFound:](v5, "setEntityNotFound:", objc_msgSend(v17, "BOOLValue"));
    v27 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionNotAllowed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setActionNotAllowed:](v5, "setActionNotAllowed:", objc_msgSend(v18, "BOOLValue"));
    v31 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unableToUndo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setUnableToUndo:](v5, "setUnableToUndo:", objc_msgSend(v19, "BOOLValue"));
    v30 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCanceled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setActionCanceled:](v5, "setActionCanceled:", objc_msgSend(v20, "BOOLValue"));
    v28 = v16;
    v29 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueDisambiguationRejected"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setValueDisambiguationRejected:](v5, "setValueDisambiguationRejected:", objc_msgSend(v21, "BOOLValue"));
    v22 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noMatchingTool"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setNoMatchingTool:](v5, "setNoMatchingTool:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("developerDefinedError"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionFailureFailure setDeveloperDefinedError:](v5, "setDeveloperDefinedError:", objc_msgSend(v24, "BOOLValue"));
    v25 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Actionfailurefailure
{
  return self->_whichOneof_Actionfailurefailure;
}

- (BOOL)hasPreflightCheckFailure
{
  return self->_hasPreflightCheckFailure;
}

- (void)setHasPreflightCheckFailure:(BOOL)a3
{
  self->_hasPreflightCheckFailure = a3;
}

- (BOOL)hasPreciseLocationDisabled
{
  return self->_hasPreciseLocationDisabled;
}

- (void)setHasPreciseLocationDisabled:(BOOL)a3
{
  self->_hasPreciseLocationDisabled = a3;
}

- (BOOL)hasLocationDisabled
{
  return self->_hasLocationDisabled;
}

- (void)setHasLocationDisabled:(BOOL)a3
{
  self->_hasLocationDisabled = a3;
}

- (BOOL)hasWifiDisabled
{
  return self->_hasWifiDisabled;
}

- (void)setHasWifiDisabled:(BOOL)a3
{
  self->_hasWifiDisabled = a3;
}

- (BOOL)hasBluetoothDisabled
{
  return self->_hasBluetoothDisabled;
}

- (void)setHasBluetoothDisabled:(BOOL)a3
{
  self->_hasBluetoothDisabled = a3;
}

- (BOOL)hasNetworkFailure
{
  return self->_hasNetworkFailure;
}

- (void)setHasNetworkFailure:(BOOL)a3
{
  self->_hasNetworkFailure = a3;
}

- (BOOL)hasPartialFailure
{
  return self->_hasPartialFailure;
}

- (void)setHasPartialFailure:(BOOL)a3
{
  self->_hasPartialFailure = a3;
}

- (BOOL)hasUnsupportedOnDevice
{
  return self->_hasUnsupportedOnDevice;
}

- (void)setHasUnsupportedOnDevice:(BOOL)a3
{
  self->_hasUnsupportedOnDevice = a3;
}

- (BOOL)hasFeatureCurrentlyRestricted
{
  return self->_hasFeatureCurrentlyRestricted;
}

- (void)setHasFeatureCurrentlyRestricted:(BOOL)a3
{
  self->_hasFeatureCurrentlyRestricted = a3;
}

- (BOOL)hasEntityNotFound
{
  return self->_hasEntityNotFound;
}

- (void)setHasEntityNotFound:(BOOL)a3
{
  self->_hasEntityNotFound = a3;
}

- (BOOL)hasActionNotAllowed
{
  return self->_hasActionNotAllowed;
}

- (void)setHasActionNotAllowed:(BOOL)a3
{
  self->_hasActionNotAllowed = a3;
}

- (BOOL)hasUnableToUndo
{
  return self->_hasUnableToUndo;
}

- (void)setHasUnableToUndo:(BOOL)a3
{
  self->_hasUnableToUndo = a3;
}

- (BOOL)hasActionCanceled
{
  return self->_hasActionCanceled;
}

- (void)setHasActionCanceled:(BOOL)a3
{
  self->_hasActionCanceled = a3;
}

- (BOOL)hasValueDisambiguationRejected
{
  return self->_hasValueDisambiguationRejected;
}

- (void)setHasValueDisambiguationRejected:(BOOL)a3
{
  self->_hasValueDisambiguationRejected = a3;
}

- (BOOL)hasNoMatchingTool
{
  return self->_hasNoMatchingTool;
}

- (void)setHasNoMatchingTool:(BOOL)a3
{
  self->_hasNoMatchingTool = a3;
}

- (BOOL)hasDeveloperDefinedError
{
  return self->_hasDeveloperDefinedError;
}

- (void)setHasDeveloperDefinedError:(BOOL)a3
{
  self->_hasDeveloperDefinedError = a3;
}

@end
