@implementation WBSFormTelemetryData

- (WBSFormTelemetryData)initWithFormType:(unint64_t)a3 formID:(int64_t)a4
{
  WBSFormTelemetryData *v6;
  WBSFormTelemetryData *v7;
  unint64_t v8;
  WBSFormTelemetryData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSFormTelemetryData;
  v6 = -[WBSFormTelemetryData init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = 3;
    if (a3 < 6)
      v8 = a3;
    v6->_formID = a4;
    v6->_formType = v8;
    v9 = v6;
  }

  return v7;
}

- (NSDictionary)fieldIDToSingleFieldData
{
  return self->_fieldIDToSingleFieldData;
}

- (void)setFieldIDToSingleFieldData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)formID
{
  return self->_formID;
}

- (unint64_t)formType
{
  return self->_formType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldIDToSingleFieldData, 0);
}

@end
