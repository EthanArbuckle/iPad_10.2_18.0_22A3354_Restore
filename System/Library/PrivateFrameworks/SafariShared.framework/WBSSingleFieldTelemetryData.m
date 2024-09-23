@implementation WBSSingleFieldTelemetryData

- (WBSSingleFieldTelemetryData)initWithFieldType:(int64_t)a3 fieldID:(id)a4 elementType:(unint64_t)a5
{
  id v9;
  WBSSingleFieldTelemetryData *v10;
  WBSSingleFieldTelemetryData *v11;
  WBSSingleFieldTelemetryData *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSSingleFieldTelemetryData;
  v10 = -[WBSSingleFieldTelemetryData init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_fieldType = a3;
    objc_storeStrong((id *)&v10->_fieldID, a4);
    v11->_elementType = a5;
    v12 = v11;
  }

  return v11;
}

- (BOOL)wasPreviouslyAutoFilled
{
  return -[WBSSingleFieldTelemetryData modificationType](self, "modificationType") > 2;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSString)fieldID
{
  return self->_fieldID;
}

- (BOOL)isAutoFilled
{
  return self->_isAutoFilled;
}

- (void)setIsAutoFilled:(BOOL)a3
{
  self->_isAutoFilled = a3;
}

- (BOOL)isManuallyFilledByUser
{
  return self->_isManuallyFilledByUser;
}

- (void)setIsManuallyFilledByUser:(BOOL)a3
{
  self->_isManuallyFilledByUser = a3;
}

- (unint64_t)modificationType
{
  return self->_modificationType;
}

- (void)setModificationType:(unint64_t)a3
{
  self->_modificationType = a3;
}

- (unint64_t)autoFillOfferedType
{
  return self->_autoFillOfferedType;
}

- (void)setAutoFillOfferedType:(unint64_t)a3
{
  self->_autoFillOfferedType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldID, 0);
}

@end
