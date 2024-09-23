@implementation TSSMutablePropertySet

- (void)addProperty:(int)a3
{
  objc_msgSend(self->super.mIndexSet, "addIndex:", a3);
}

- (TSSMutablePropertySet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSMutablePropertySet;
  return -[TSSPropertySet initWithIndexSet:](&v3, sel_initWithIndexSet_, objc_msgSend(MEMORY[0x24BDD1698], "indexSet"));
}

- (TSSMutablePropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  return -[TSSPropertySet initWithIndexSet:](self, "initWithIndexSet:", objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(_QWORD *)&a3, a4));
}

- (TSSMutablePropertySet)initWithPropertySet:(id)a3
{
  return -[TSSPropertySet initWithIndexSet:](self, "initWithIndexSet:", (id)objc_msgSend(*((id *)a3 + 1), "mutableCopy"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSSPropertySet initWithIndexSet:]([TSSPropertySet alloc], "initWithIndexSet:", (id)objc_msgSend(self->super.mIndexSet, "copy"));
}

- (void)addProperties:(id)a3
{
  if (a3)
    objc_msgSend(self->super.mIndexSet, "addIndexes:", *((_QWORD *)a3 + 1));
}

- (void)removeProperty:(int)a3
{
  objc_msgSend(self->super.mIndexSet, "removeIndex:", a3);
}

- (void)removeProperties:(id)a3
{
  if (a3)
    objc_msgSend(self->super.mIndexSet, "removeIndexes:", *((_QWORD *)a3 + 1));
}

- (void)intersectPropertySet:(id)a3
{
  id v5;

  v5 = (id)-[TSSMutablePropertySet mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "removeProperties:", a3);
  -[TSSMutablePropertySet removeProperties:](self, "removeProperties:", v5);

}

@end
