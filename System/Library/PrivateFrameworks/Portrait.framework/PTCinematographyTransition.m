@implementation PTCinematographyTransition

- (PTCinematographyTransition)initWithKind:(unint64_t)a3
{
  PTCinematographyTransition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyTransition;
  result = -[PTCinematographyTransition init](&v5, sel_init);
  if (result)
    result->_kind = a3;
  return result;
}

- (float)coefficientForNormalizedTime:(float)a3
{
  double v5;
  float result;
  NSObject *v7;

  if (-[PTCinematographyTransition kind](self, "kind") == 1)
  {
    *(float *)&v5 = a3;
    -[PTCinematographyTransition linearCoefficientForNormalizedTime:](self, "linearCoefficientForNormalizedTime:", v5);
  }
  else
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PTCinematographyTransition coefficientForNormalizedTime:].cold.1(self, v7);

    return 0.0;
  }
  return result;
}

- (float)linearCoefficientForNormalizedTime:(float)result
{
  float v3;
  BOOL v4;

  v3 = 1.0;
  if (result > 1.0)
  {
    v4 = 1;
  }
  else
  {
    v3 = 0.0;
    v4 = result < 0.0;
  }
  if (v4)
    return v3;
  return result;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (void)coefficientForNormalizedTime:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "kind");
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "unimplemented transition kind %ld", (uint8_t *)&v3, 0xCu);
}

@end
