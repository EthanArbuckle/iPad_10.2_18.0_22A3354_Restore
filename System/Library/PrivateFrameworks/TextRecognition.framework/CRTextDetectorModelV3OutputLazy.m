@implementation CRTextDetectorModelV3OutputLazy

- (CRTextDetectorModelV3OutputLazy)initWithVisionCoreNamedObjects:(id)a3 fromFunctionDescriptor:(id)a4
{
  id v7;
  id v8;
  CRTextDetectorModelV3OutputLazy *v9;
  CRTextDetectorModelV3OutputLazy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRTextDetectorModelV3OutputLazy;
  v9 = -[CRTextDetectorModelV3Output init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputObjects, a3);
    objc_storeStrong((id *)&v10->_functionDescriptor, a4);
  }

  return v10;
}

- (BOOL)isLazy
{
  return 1;
}

- (id)region_score
{
  MLMultiArray *region_score;
  MLMultiArray *v4;
  MLMultiArray *v5;

  region_score = self->super._region_score;
  if (!region_score)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("region_score"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._region_score;
    self->super._region_score = v4;

    region_score = self->super._region_score;
  }
  return region_score;
}

- (id)script_feature
{
  MLMultiArray *script_feature;
  MLMultiArray *v4;
  MLMultiArray *v5;

  script_feature = self->super._script_feature;
  if (!script_feature)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("script_feature"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._script_feature;
    self->super._script_feature = v4;

    script_feature = self->super._script_feature;
  }
  return script_feature;
}

- (id)link_score_horizontal
{
  MLMultiArray *link_score_horizontal;
  MLMultiArray *v4;
  MLMultiArray *v5;

  link_score_horizontal = self->super._link_score_horizontal;
  if (!link_score_horizontal)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("link_score_horizontal"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._link_score_horizontal;
    self->super._link_score_horizontal = v4;

    link_score_horizontal = self->super._link_score_horizontal;
  }
  return link_score_horizontal;
}

- (id)link_score_vertical
{
  MLMultiArray *link_score_vertical;
  MLMultiArray *v4;
  MLMultiArray *v5;

  link_score_vertical = self->super._link_score_vertical;
  if (!link_score_vertical)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("link_score_vertical"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._link_score_vertical;
    self->super._link_score_vertical = v4;

    link_score_vertical = self->super._link_score_vertical;
  }
  return link_score_vertical;
}

- (id)table_score
{
  MLMultiArray *table_score;
  MLMultiArray *v4;
  MLMultiArray *v5;

  table_score = self->super._table_score;
  if (!table_score)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("table_score"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._table_score;
    self->super._table_score = v4;

    table_score = self->super._table_score;
  }
  return table_score;
}

- (id)orientation_score
{
  MLMultiArray *orientation_score;
  MLMultiArray *v4;
  MLMultiArray *v5;

  orientation_score = self->super._orientation_score;
  if (!orientation_score)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("orientation_score"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._orientation_score;
    self->super._orientation_score = v4;

    orientation_score = self->super._orientation_score;
  }
  return orientation_score;
}

- (id)text_type_score
{
  MLMultiArray *text_type_score;
  MLMultiArray *v4;
  MLMultiArray *v5;

  text_type_score = self->super._text_type_score;
  if (!text_type_score)
  {
    +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("text_type_score"), self->_outputObjects, self->_functionDescriptor, 0);
    v4 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._text_type_score;
    self->super._text_type_score = v4;

    text_type_score = self->super._text_type_score;
  }
  return text_type_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
  objc_storeStrong((id *)&self->_outputObjects, 0);
}

@end
