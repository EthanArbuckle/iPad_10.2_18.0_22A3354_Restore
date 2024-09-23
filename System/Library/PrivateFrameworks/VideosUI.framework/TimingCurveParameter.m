@implementation TimingCurveParameter

- (int64_t)timingCurveType
{
  int64_t result;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  return result;
}

- (void)setTimingCurveType:(int64_t)a3
{
  OUTLINED_FUNCTION_4();
  *(_QWORD *)self->timingCurveType = a3;
  OUTLINED_FUNCTION_6();
}

- (UICubicTimingParameters)cubicTimingParameters
{
  id v3;
  UICubicTimingParameters *result;

  OUTLINED_FUNCTION_4();
  v3 = *(id *)self->cubicTimingParameters;
  OUTLINED_FUNCTION_6();
  return result;
}

- (void)setCubicTimingParameters:(id)a3
{
  void *v5;
  id v6;

  OUTLINED_FUNCTION_4();
  v5 = *(void **)self->cubicTimingParameters;
  *(_QWORD *)self->cubicTimingParameters = a3;
  v6 = a3;

  OUTLINED_FUNCTION_0_9();
}

- (UISpringTimingParameters)springTimingParameters
{
  id v3;
  UISpringTimingParameters *result;

  OUTLINED_FUNCTION_4();
  v3 = *(id *)self->springTimingParameters;
  OUTLINED_FUNCTION_6();
  return result;
}

- (void)setSpringTimingParameters:(id)a3
{
  void *v5;
  id v6;

  OUTLINED_FUNCTION_4();
  v5 = *(void **)self->springTimingParameters;
  *(_QWORD *)self->springTimingParameters = a3;
  v6 = a3;

  OUTLINED_FUNCTION_0_9();
}

- (void)encodeWithCoder:(id)a3
{
  sub_1D9D7BFE0();
}

- (_TtC8VideosUI20TimingCurveParameter)initWithCoder:(id)a3
{
  sub_1D9D7C040();
}

- (id)copyWithZone:(void *)a3
{
  id result;
  _QWORD v4[4];

  swift_retain();
  sub_1D9D7C088(v4);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_1DA1450EC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  OUTLINED_FUNCTION_6();
  return result;
}

@end
