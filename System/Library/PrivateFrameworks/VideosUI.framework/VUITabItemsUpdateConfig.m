@implementation VUITabItemsUpdateConfig

- (VUITabItemsUpdateConfig)init
{
  VUITabItemsUpdateConfig *v2;
  NSDictionary *v3;
  void *v4;
  void *v5;
  NSDictionary *eventDescriptors;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VUITabItemsUpdateConfig;
  v2 = -[VUITabItemsUpdateConfig init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9[0] = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 28800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = CFSTR("animated");
    v10[0] = v4;
    v10[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v5, CFSTR("refreshTTL"));

    eventDescriptors = v2->_eventDescriptors;
    v2->_eventDescriptors = v3;

  }
  return v2;
}

- (void)setEventDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_eventDescriptors, a3);
}

- (NSDictionary)eventDescriptors
{
  return self->_eventDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescriptors, 0);
}

@end
