@implementation WFPosterParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return +[WFPosterRepresentation posterWithSerializedRepresentation:](WFPosterRepresentation, "posterWithSerializedRepresentation:", a3, a4, a5);
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "serializedRepresentation");
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
