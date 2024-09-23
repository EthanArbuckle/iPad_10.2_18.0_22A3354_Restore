@implementation PXGEngineRecordingChangeDetailsSerializable

- (PXGEngineRecordingChangeDetailsSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGEngineRecordingChangeDetailsSerializable *v5;
  uint64_t v6;
  NSDictionary *changeDetails;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGEngineRecordingChangeDetailsSerializable;
  v5 = -[PXGEngineRecordingChangeDetailsSerializable init](&v9, sel_init);
  if (v5)
  {
    PXGCreateDictionaryWithTransforms(v4, &__block_literal_global_5_187880, &__block_literal_global_187871);
    v6 = objc_claimAutoreleasedReturnValue();
    changeDetails = v5->_changeDetails;
    v5->_changeDetails = (NSDictionary *)v6;

  }
  return v5;
}

- (id)createSerializableObject
{
  void *v2;
  void *v3;

  -[PXGEngineRecordingChangeDetailsSerializable changeDetails](self, "changeDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v2, &__block_literal_global_2_187874, &__block_literal_global_187871);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)changeDetails
{
  return self->_changeDetails;
}

- (void)setChangeDetails:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

@end
