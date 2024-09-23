@implementation WiFiP2PAWDLStateMonitorConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiP2PAWDLStateMonitorConfiguration)init
{
  WiFiP2PAWDLStateMonitorConfiguration *v2;
  WiFiP2PAWDLStateMonitorConfiguration *v3;
  NSArray *servicesRequiringAvailabilityNotification;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WiFiP2PAWDLStateMonitorConfiguration;
  v2 = -[WiFiP2PAWDLStateMonitorConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    servicesRequiringAvailabilityNotification = v2->_servicesRequiringAvailabilityNotification;
    v2->_options = 0;
    v2->_servicesRequiringAvailabilityNotification = 0;

  }
  return v3;
}

- (WiFiP2PAWDLStateMonitorConfiguration)initWithCoder:(id)a3
{
  id v4;
  WiFiP2PAWDLStateMonitorConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSArray *servicesRequiringAvailabilityNotification;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiP2PAWDLStateMonitorConfiguration;
  v5 = -[WiFiP2PAWDLStateMonitorConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLStateMonitor.optionsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("AWDLStateMonitor.services"));
    v7 = objc_claimAutoreleasedReturnValue();
    servicesRequiringAvailabilityNotification = v5->_servicesRequiringAvailabilityNotification;
    v5->_servicesRequiringAvailabilityNotification = (NSArray *)v7;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WiFiP2PAWDLStateMonitorConfiguration *v4;
  WiFiP2PAWDLStateMonitorConfiguration *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  v4 = (WiFiP2PAWDLStateMonitorConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[WiFiP2PAWDLStateMonitorConfiguration options](self, "options");
  if (v6 != -[WiFiP2PAWDLStateMonitorConfiguration options](v5, "options"))
    goto LABEL_6;
  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](self, "servicesRequiringAvailabilityNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](v5, "servicesRequiringAvailabilityNotification");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](self, "servicesRequiringAvailabilityNotification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](v5, "servicesRequiringAvailabilityNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
LABEL_8:
    v13 = 1;
    goto LABEL_10;
  }
LABEL_6:
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[WiFiP2PAWDLStateMonitorConfiguration options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AWDLStateMonitor.optionsKey"));

  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](self, "servicesRequiringAvailabilityNotification");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("AWDLStateMonitor.services"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiP2PAWDLStateMonitorConfiguration *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(WiFiP2PAWDLStateMonitorConfiguration);
  -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v4, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](self, "options"));
  -[WiFiP2PAWDLStateMonitorConfiguration servicesRequiringAvailabilityNotification](self, "servicesRequiringAvailabilityNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WiFiP2PAWDLStateMonitorConfiguration setServicesRequiringAvailabilityNotification:](v4, "setServicesRequiringAvailabilityNotification:", v6);

  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)servicesRequiringAvailabilityNotification
{
  return self->_servicesRequiringAvailabilityNotification;
}

- (void)setServicesRequiringAvailabilityNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesRequiringAvailabilityNotification, 0);
}

@end
