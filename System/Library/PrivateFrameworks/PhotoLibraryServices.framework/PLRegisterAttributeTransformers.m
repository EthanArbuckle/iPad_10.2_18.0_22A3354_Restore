@implementation PLRegisterAttributeTransformers

void __PLRegisterAttributeTransformers_block_invoke()
{
  PLPropertyListFromDataTransformer *v0;
  PLRectValueFromDataTransformer *v1;
  PLGlobalKeyValueAnyTransformer *v2;
  PLUUIDStringFromUUIDDataTransformer *v3;

  v3 = objc_alloc_init(PLUUIDStringFromUUIDDataTransformer);
  objc_msgSend(MEMORY[0x1E0CB3B20], "setValueTransformer:forName:", v3, CFSTR("PLUUIDStringFromUUIDData"));
  v0 = objc_alloc_init(PLPropertyListFromDataTransformer);
  objc_msgSend(MEMORY[0x1E0CB3B20], "setValueTransformer:forName:", v0, CFSTR("PLPropertyListFromData"));
  v1 = objc_alloc_init(PLRectValueFromDataTransformer);
  objc_msgSend(MEMORY[0x1E0CB3B20], "setValueTransformer:forName:", v1, CFSTR("PLRectValueFromData"));
  v2 = objc_alloc_init(PLGlobalKeyValueAnyTransformer);
  objc_msgSend(MEMORY[0x1E0CB3B20], "setValueTransformer:forName:", v2, CFSTR("PLGlobalKeyValueAnyTransformer"));

}

@end
