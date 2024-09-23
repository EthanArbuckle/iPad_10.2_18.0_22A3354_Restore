@implementation TMLSignalDescriptor

- (TMLSignalDescriptor)initWithName:(id)a3 parameters:(id)a4
{
  double v4;

  return (TMLSignalDescriptor *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(self, a2, v4, a3, 1, a4, 0, 0);
}

- (TMLSignalDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TMLSignalDescriptor;
  return -[TMLMethodDescriptor initWithName:returnType:parameters:methodSelector:attributes:](&v8, sel_initWithName_returnType_parameters_methodSelector_attributes_, a3, a4, a5, a6, a7);
}

@end
