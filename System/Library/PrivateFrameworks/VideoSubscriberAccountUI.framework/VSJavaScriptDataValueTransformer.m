@implementation VSJavaScriptDataValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const OpaqueJSContext *v7;
  OpaqueJSValue *v8;
  size_t ArrayBufferByteLength;

  v3 = a3;
  if (objc_msgSend(v3, "isString"))
  {
    objc_msgSend(v3, "toString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 0)) == 0)
    {
      objc_msgSend(v4, "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v3, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const OpaqueJSContext *)objc_msgSend(v6, "JSGlobalContextRef");

    v8 = (OpaqueJSValue *)objc_msgSend(v3, "JSValueRef");
    v5 = 0;
    if (JSValueGetTypedArrayType(v7, v8, 0) == kJSTypedArrayTypeArrayBuffer)
    {
      if (JSValueIsObject(v7, v8))
      {
        ArrayBufferByteLength = JSObjectGetArrayBufferByteLength(v7, v8, 0);
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", JSObjectGetArrayBufferBytesPtr(v7, v8, 0), ArrayBufferByteLength);
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "object");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithObject:inContext:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
