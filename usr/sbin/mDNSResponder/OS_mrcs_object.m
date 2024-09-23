@implementation OS_mrcs_object

- (void)dealloc
{
  Class i;
  void (*v4)(OS_mrcs_object *, SEL);
  objc_super v5;

  for (i = self[2].super.super.isa; i; i = *(Class *)i)
  {
    v4 = (void (*)(OS_mrcs_object *, SEL))*((_QWORD *)i + 5);
    if (v4)
      v4(self, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_mrcs_object;
  -[OS_mrcs_object dealloc](&v5, "dealloc");
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
  OS_mrcs_object *v4;
  uint64_t v5;
  Class isa;
  char v7;
  uint64_t (*v9)(OS_mrcs_object *, OS_mrcs_object *);

  v4 = (OS_mrcs_object *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class(OS_mrcs_object);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && (isa = self[2].super.super.isa, isa == v4[2].super.super.isa)
      && (v9 = (uint64_t (*)(OS_mrcs_object *, OS_mrcs_object *))*((_QWORD *)isa + 4)) != 0)
    {
      v7 = v9(self, v4);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
