@implementation GTCaptureUpdateConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureUpdateConfiguration)initWithCoder:(id)a3
{
  id v4;
  GTCaptureUpdateConfiguration *v5;
  uint64_t v6;
  GTCaptureConfiguration *configuration;
  GTCaptureUpdateConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTCaptureUpdateConfiguration;
  v5 = -[GTCaptureRequest initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("configuration")));
    configuration = v5->_configuration;
    v5->_configuration = (GTCaptureConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTCaptureUpdateConfiguration;
  v4 = a3;
  -[GTCaptureRequest encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);

}

- (GTCaptureConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
