@implementation CHDDataValueProperties

- (CHDDataValueProperties)init
{
  CHDDataValueProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataValueProperties;
  result = -[CHDDataValueProperties init](&v3, sel_init);
  if (result)
    result->mDataValueIndex = -1;
  return result;
}

- (void)setDataValueIndex:(unint64_t)a3
{
  self->mDataValueIndex = a3;
}

- (void)setGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mGraphicProperties;
  OADGraphicProperties *mGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }

}

- (void)setMarker:(id)a3
{
  CHDMarker *v5;
  CHDMarker **p_mMarker;
  CHDMarker *mMarker;
  CHDMarker *v8;

  v5 = (CHDMarker *)a3;
  mMarker = self->mMarker;
  p_mMarker = &self->mMarker;
  if (mMarker != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mMarker, a3);
    v5 = v8;
  }

}

- (int64_t)key
{
  return self->mDataValueIndex;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unint64_t)dataValueIndex
{
  return self->mDataValueIndex;
}

- (id)shallowCopyWithIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "dataValueProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setDataValueIndex:", a3);
    objc_msgSend(v6, "setGraphicProperties:", self->mGraphicProperties);
    objc_msgSend(v6, "setMarker:", self->mMarker);
    objc_msgSend(v6, "setDataLabel:", self->mDataLabel);
    v7 = v6;
  }

  return v6;
}

+ (id)dataValueProperties
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)setDataLabel:(id)a3
{
  CHDDataLabel *v5;
  CHDDataLabel **p_mDataLabel;
  CHDDataLabel *mDataLabel;
  CHDDataLabel *v8;

  v5 = (CHDDataLabel *)a3;
  mDataLabel = self->mDataLabel;
  p_mDataLabel = &self->mDataLabel;
  if (mDataLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDataLabel, a3);
    v5 = v8;
  }

}

- (id)dataLabel
{
  return self->mDataLabel;
}

- (id)marker
{
  return self->mMarker;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataValueProperties;
  -[CHDDataValueProperties description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMarker, 0);
  objc_storeStrong((id *)&self->mDataLabel, 0);
}

@end
