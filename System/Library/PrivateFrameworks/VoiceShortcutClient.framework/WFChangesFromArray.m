@implementation WFChangesFromArray

WFDatabaseObjectDescriptor *__WFChangesFromArray_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFDatabaseObjectDescriptor *v3;

  v2 = a2;
  v3 = -[WFDatabaseObjectDescriptor initWithDictionaryRepresentation:]([WFDatabaseObjectDescriptor alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

@end
