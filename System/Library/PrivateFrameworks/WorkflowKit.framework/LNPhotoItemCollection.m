@implementation LNPhotoItemCollection

uint64_t __59__LNPhotoItemCollection_Workflow__serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

id __95__LNPhotoItemCollection_Workflow__initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D43D70];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSerializedRepresentation:", v3);

  return v4;
}

@end
