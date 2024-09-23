@implementation OS_mdns_object

- (void)dealloc
{
  Class i;
  void (*v4)(OS_mdns_object *, SEL);
  objc_super v5;

  for (i = self[2].super.super.isa; i; i = *(Class *)i)
  {
    v4 = (void (*)(OS_mdns_object *, SEL))*((_QWORD *)i + 5);
    if (v4)
      v4(self, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_mdns_object;
  -[OS_mdns_object dealloc](&v5, "dealloc");
}

- (NSString)description
{
  return (NSString *)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (NSString)debugDescription
{
  return (NSString *)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (id)redactedDescription
{
  return (id)(id)_mdns_obj_copy_description_as_cfstring((uint64_t)self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  Class isa;
  uint64_t (*v8)(OS_mdns_object *, id);

  if (self == a3)
    return 1;
  v5 = objc_opt_class(OS_mdns_object);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0
    && (isa = self[2].super.super.isa, isa == *((Class *)a3 + 2))
    && (v8 = (uint64_t (*)(OS_mdns_object *, id))*((_QWORD *)isa + 4)) != 0)
  {
    return v8(self, a3);
  }
  else
  {
    return 0;
  }
}

@end
