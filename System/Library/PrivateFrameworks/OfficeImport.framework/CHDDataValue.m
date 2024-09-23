@implementation CHDDataValue

- (id).cxx_construct
{
  CsData::CsData((CsData *)&self->mDataPoint.value);
  return self;
}

- (CHDDataValue)initWithIndex:(int64_t)a3 value:(EDValue *)a4
{
  CHDDataValue *v6;
  CHDDataValue *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHDDataValue;
  v6 = -[CHDDataValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mDataPoint.index = a3;
    EDValue::operator=((uint64_t)&v6->mDataPoint.value, &a4->type);
  }
  return v7;
}

+ (CHDDataValue)dataValueWithIndex:(int64_t)a3 value:(EDValue *)a4
{
  return (CHDDataValue *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndex:value:", a3, a4);
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mDataPoint.contentFormatId = a3;
}

- (EDValue)value
{
  return &self->mDataPoint.value;
}

- (void).cxx_destruct
{
  EDValue::~EDValue(&self->mDataPoint.value);
}

- (void)setIndex:(int64_t)a3
{
  self->mDataPoint.index = a3;
}

- (CHDDataPoint)dataPoint
{
  return &self->mDataPoint;
}

+ (id)dataValue
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (CHDDataValue)init
{
  CHDDataValue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataValue;
  result = -[CHDDataValue init](&v3, sel_init);
  if (result)
  {
    result->mDataPoint.index = -1;
    result->mDataPoint.contentFormatId = -1;
  }
  return result;
}

- (void)setValue:(EDValue *)a3
{
  EDValue::operator=((uint64_t)&self->mDataPoint.value, &a3->type);
}

- (void)setContentFormatWithResources:(id)a3 resources:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "formatId");
  if (v7 == -1)
  {
    objc_msgSend(v6, "contentFormats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v8, "addOrEquivalentObject:", v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->mDataPoint.contentFormatId = objc_msgSend(v9, "formatId");

  }
  else
  {
    self->mDataPoint.contentFormatId = v7;
  }

}

- (int64_t)index
{
  return self->mDataPoint.index;
}

- (void)setDataPoint:(CHDDataPoint *)a3
{
  self->mDataPoint.index = a3->index;
  EDValue::operator=((uint64_t)&self->mDataPoint.value, &a3->value.type);
  self->mDataPoint.contentFormatId = a3->contentFormatId;
}

- (id)contentFormatWithResources:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithKey:", self->mDataPoint.contentFormatId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataValue;
  -[CHDDataValue description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)contentFormatId
{
  return self->mDataPoint.contentFormatId;
}

@end
