@implementation TIEventDescriptor

- (TIEventDescriptor)initWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  TIEventDescriptor *v14;
  TIEventDescriptor *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIEventDescriptor;
  v14 = -[TIEventDescriptor init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventName, a3);
    objc_storeStrong((id *)&v15->_eventDescription, a4);
    objc_storeStrong((id *)&v15->_fieldDescriptors, a5);
    v15->_includeTestingParameters = a6;
  }

  return v15;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSArray)fieldDescriptors
{
  return self->_fieldDescriptors;
}

- (BOOL)includeTestingParameters
{
  return self->_includeTestingParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDescriptors, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (id)eventDescriptorWithEventName:(id)a3 eventDescription:(id)a4 fieldDescriptors:(id)a5 includeTestingParameters:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  TIEventDescriptor *v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[TIEventDescriptor initWithEventName:eventDescription:fieldDescriptors:includeTestingParameters:]([TIEventDescriptor alloc], "initWithEventName:eventDescription:fieldDescriptors:includeTestingParameters:", v11, v10, v9, v6);

  return v12;
}

@end
