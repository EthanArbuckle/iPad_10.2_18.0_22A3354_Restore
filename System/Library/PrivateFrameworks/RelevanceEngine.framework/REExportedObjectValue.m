@implementation REExportedObjectValue

- (REExportedObjectValue)initWithObject:(id)a3
{
  id v5;
  REExportedObjectValue *v6;
  REExportedObjectValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedObjectValue;
  v6 = -[REExportedObjectValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_object, a3);
    v7->_allowsEncoding = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

- (id)objectValue
{
  return self->_object;
}

- (unint64_t)type
{
  return 2;
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    +[RESingleton sharedInstance](REInterfaceCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__REExportedObjectValue_enumerateValuesUsingBlock___block_invoke;
    v7[3] = &unk_24CF8AE78;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "enumerateExportedPropertiesOfClass:usingBlock:", v6, v7);

  }
}

void __51__REExportedObjectValue_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (unint64_t)propertyCount
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__REExportedObjectValue_propertyCount__block_invoke;
  v4[3] = &unk_24CF8AEA0;
  v4[4] = &v5;
  -[REExportedObjectValue enumerateValuesUsingBlock:](self, "enumerateValuesUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__REExportedObjectValue_propertyCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)shouldEncodeProperty:(id)a3
{
  if (self->_allowsEncoding)
    return objc_msgSend(self->_object, "shouldEncodeProperty:", a3);
  else
    return 1;
}

- (id)exportedValueForKey:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super exc_buf;

  v4 = (NSString *)a3;
  NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[REExportedValue exportedValueForKey:](&exc_buf, sel_exportedValueForKey_, v4, v8.receiver, v8.super_class, self, REExportedObjectValue);
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(self->_object, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[REExportedValue exportedValueForKey:](&v8, sel_exportedValueForKey_, v4, self, REExportedObjectValue, exc_buf.receiver, exc_buf.super_class);
    goto LABEL_6;
  }
  +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
