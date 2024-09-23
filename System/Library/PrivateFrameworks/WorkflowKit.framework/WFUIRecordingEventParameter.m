@implementation WFUIRecordingEventParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
