@implementation WFColorPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79F8]), "initWithSystemColor:", 22);
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
