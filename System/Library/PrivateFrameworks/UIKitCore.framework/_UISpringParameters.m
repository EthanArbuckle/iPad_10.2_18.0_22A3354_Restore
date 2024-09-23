@implementation _UISpringParameters

+ (_UISpringParameters)parametersWithDampingRatio:(double)a3 response:(double)a4
{
  return (_UISpringParameters *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDampingRatio:response:", a3, a4);
}

- (_UISpringParameters)initWithDampingRatio:(double)a3 response:(double)a4
{
  _UISpringParameters *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISpringParameters;
  result = -[_UISpringParameters init](&v7, sel_init);
  if (result)
  {
    result->__dampingRatio = a3;
    result->__response = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISpringParameters)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_dampingRatio"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_response"));
  v8 = v7;

  return -[_UISpringParameters initWithDampingRatio:response:](self, "initWithDampingRatio:response:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double dampingRatio;
  id v5;

  dampingRatio = self->__dampingRatio;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_dampingRatio"), dampingRatio);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_response"), self->__response);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_UISpringParameters _dampingRatio](self, "_dampingRatio");
    v7 = v6;
    objc_msgSend(v5, "_dampingRatio");
    if (v7 == v8)
    {
      -[_UISpringParameters _response](self, "_response");
      v10 = v9;
      objc_msgSend(v5, "_response");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel__dampingRatio);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel__response);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_dampingRatio
{
  return self->__dampingRatio;
}

- (double)_response
{
  return self->__response;
}

@end
